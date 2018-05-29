package org.thealpha.controller;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thealpha.model.*;
import org.thealpha.service.RecommendService;
import org.thealpha.service.ScholarCooperateService;
import org.thealpha.service.ScholarInfoService;
import org.thealpha.service.TeacherStudentService;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.JedisCluster;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class CooperateRelaController {

    @Autowired
    private ScholarCooperateService scholarCooperateService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @Autowired
    private RecommendService recommendService;

    @Resource
    private JedisCluster jedisCluster;

    @RequestMapping("/relationGraph/{scholarId}/{type}")
    public String index(@PathVariable String scholarId, @PathVariable String type, Model model) {
        if ("name".equals(type)) {
            SearchItem searchItem = new SearchItem();
            searchItem.setScholarName(scholarId);
            List<Scholar> scholars = null;
            try {
                scholars = scholarInfoService.getScholarsBySearchItems(searchItem);
            } catch (IOException e) {
                e.printStackTrace();
            }
            String index = null;
            double maxHindex = -1;
            if (CollectionUtils.isNotEmpty(scholars)) {
                for (Scholar scholar : scholars) {
                    if (scholar.getHindex() > maxHindex) {
                        maxHindex = scholar.getHindex();
                        index = scholar.getIndex();
                    }
                }
            }
            model.addAttribute("scholarId", index);
            model.addAttribute("type", "directCooperate");
        } else {
            model.addAttribute("scholarId", scholarId);
            model.addAttribute("type", type);
        }

        return "leftNav";
    }

    @RequestMapping("/relationGraph/index")
    public String index2(String scholarName, Model model) {
        model.addAttribute("scholarName", scholarName);
        model.addAttribute("type", "name");
        return "leftNav";
    }

    @RequestMapping("/cooperateRela/{scholarId}/count")
    public String helloWorld(@PathVariable String scholarId, Model model, HttpSession session) {
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);

        List<YearCount> yearCounts = scholarCooperateService.getCooperateYearCountsById(scholarId);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            recommendService.addWeight(user.getEmail(), scholarId);
        }
        model.addAttribute("cooperaters", cooperaters);
        model.addAttribute("middleScholar", scholar);
        model.addAttribute("yearCounts", yearCounts);
        model.addAttribute("scholarId", scholarId);

//        return "cooperateRela";
//        return "worldMap";
        return "leftNav";

    }

    @RequestMapping("/cooperate/{scholarId}/{type}")
    public String cooperateGraph(@PathVariable String scholarId, @PathVariable String type, Model model) {
        model.addAttribute("cooperateType", type);
        model.addAttribute("scholarId", scholarId);
//        return "cooperate";
        return "relationGraph";
    }

    @RequestMapping(value = "/directCooperateJSON/{scholarId}")
    @ResponseBody
    public Graph getDirectCooperateJSON(@PathVariable String scholarId) {
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
            Scholar scholar = scholarInfoService.getScholarById(scholarId);

        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(scholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(scholar.getQindex());
        midNode.setHindex(scholar.getHindex());
        midNode.setAff(scholar.getAff());
        midNode.setStudyField(scholar.getFieldName());
        List<Node> nodes = new ArrayList<Node>();
        nodes.add(midNode);
        List<Link> links = new ArrayList<Link>();
        for (Cooperater cooperater : cooperaters) {
            Node node = new Node();
            node.setId(cooperater.getIndex());
            node.setName(cooperater.getName());
            node.setSize(String.valueOf(cooperater.getCount() + 5));
            if (cooperater.getCount() > 5) {
                node.setColor("#CCFF66");
            } else {
                node.setColor("#66CCCC");
            }
            node.setQindex(cooperater.getQindex());
            node.setHindex(cooperater.getHindex());
            node.setAff(cooperater.getAff());
            node.setStudyField(cooperater.getFieldName());
            nodes.add(node);

            Link link = new Link();
            link.setSource(scholarId);
            link.setTarget(cooperater.getIndex());
            link.setCoCount(cooperater.getCount());
            links.add(link);
        }
        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }

//    最有价值的合作者，most valuable collector
    @RequestMapping(value = "/MVCJSON/{scholarId}")
    @ResponseBody
    public Graph getMVCJSON(@PathVariable String scholarId) {
        Graph g = (Graph) ListTranscoder.deserialize(jedisCluster.hget(ConfigurationConstant.REDIS_AUTHORID_MVC_GRAPH.getBytes(), scholarId.getBytes()));
        if (g != null) {
            return g;
        }
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);

        List<String> joinNodes = new ArrayList<String>();
        List<String> visitedNodes = new ArrayList<String>();
        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(scholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(scholar.getQindex());
        midNode.setHindex(scholar.getHindex());
        midNode.setAff(scholar.getAff());
        midNode.setStudyField(scholar.getFieldName());
        List<Node> nodes = new ArrayList<Node>();
        nodes.add(midNode);
        joinNodes.add(scholarId);
        visitedNodes.add(scholarId);
        List<Link> links = new ArrayList<Link>();
        setAllMVCNodes(scholarId, cooperaters, visitedNodes, joinNodes, nodes, links);

        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        jedisCluster.hset(ConfigurationConstant.REDIS_AUTHORID_MVC_GRAPH.getBytes(), scholarId.getBytes(), ListTranscoder.serialize(graph));
        return graph;
    }

    @RequestMapping("/flights")
    public String flights() {
        return "flights";
    }

    public void setAllMVCNodes(String scholarId, List<Cooperater> cooperaters, List<String> visitedNodes, List<String> joinNodes, List<Node> nodes, List<Link> links) {
        for (Cooperater cooperater : cooperaters) {
            if (!joinNodes.contains(cooperater.getIndex())) {
                Node node = new Node();
                node.setId(cooperater.getIndex());
                node.setName(cooperater.getName());
                node.setSize(String.valueOf(cooperater.getCount() + 2));
                if (cooperater.getCount() > 5) {
                    node.setColor("#CCFF66");
                } else {
                    node.setColor("#66CCCC");
                }
                node.setQindex(cooperater.getQindex());
                node.setHindex(cooperater.getHindex());
                node.setAff(cooperater.getAff());
                node.setStudyField(cooperater.getFieldName());
                nodes.add(node);
                joinNodes.add(cooperater.getIndex());

                Link link = new Link();
                link.setSource(scholarId);
                link.setTarget(cooperater.getIndex());
                link.setCoCount(cooperater.getCount());
                links.add(link);

            }
            if (cooperater.getCount() > 5 && !visitedNodes.contains(cooperater.getIndex())) {
                visitedNodes.add(cooperater.getIndex());
                List<Cooperater> subCooperaters = scholarCooperateService.getCooperaterById(cooperater.getIndex());
                setAllMVCNodes(cooperater.getIndex(), subCooperaters, visitedNodes, joinNodes, nodes, links);
            }
        }
    }

    @RequestMapping("/cooperate/{scholarId}/worldMap")
    public String worldMap(@PathVariable String scholarId, Model model) {
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);
        model.addAttribute("cooperaters", cooperaters);
        model.addAttribute("middleScholar", scholar);
        model.addAttribute("scholarId", scholarId);
        return "worldMap";
    }

    @RequestMapping("/cooperate/{scholarId}/yearCounts")
    public String yearCounts(@PathVariable String scholarId, Model model) {
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);
        List<YearCount> yearCounts = scholarCooperateService.getCooperateYearCountsById(scholarId);
        model.addAttribute("cooperaters", cooperaters);
        model.addAttribute("middleScholar", scholar);
        model.addAttribute("yearCounts", yearCounts);
        model.addAttribute("scholarId", scholarId);
        return "cooperateNumber";

    }

//    根据合作强度去寻找合作者,minCI为最低合作强度,maxDepth为最大合作跳数
    @RequestMapping("/cooperate/{scholarId}/ci")
    @ResponseBody
    public Graph collaboratorsIntensity(@PathVariable String scholarId, @RequestParam(name = "minCI", defaultValue = "0.01") String minCI, @RequestParam(name = "maxDepth", defaultValue = "1") String maxDepth) {
        List<Cooperater> cooperaters = scholarCooperateService.getCooperaterById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);

        List<String> visitedNodes = new ArrayList<String>();
        List<String> visitedEdges = new ArrayList<String>();
        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(scholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(scholar.getQindex());
        midNode.setHindex(scholar.getHindex());
        midNode.setAff(scholar.getAff());
        midNode.setStudyField(scholar.getFieldName());
        List<Node> nodes = new ArrayList<Node>();
        nodes.add(midNode);
        visitedNodes.add(scholarId);
        List<Link> links = new ArrayList<Link>();
        int initialDepth = 0;
        scholarCooperateService.getCollaboratorsByScholarIdAndCI(scholarId, cooperaters, visitedNodes, visitedEdges, nodes, links, Double.parseDouble(minCI), initialDepth, Integer.parseInt(maxDepth));
        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }

    @RequestMapping("/cooperate/{scholarId}/everyYearCollaborators")
    @ResponseBody
    public Graph getEveryYearCollaborators(@PathVariable String scholarId) {
        Scholar scholar = scholarInfoService.getScholarById(scholarId);
        List<Cooperater> everyYearCollaborators = scholarCooperateService.getEveryYearCollaboratorsById(scholarId);

        List<Node> nodes = new ArrayList<Node>();
        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(scholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(scholar.getQindex());
        midNode.setHindex(scholar.getHindex());
        midNode.setAff(scholar.getAff());
        midNode.setStudyField(scholar.getFieldName());
        nodes.add(midNode);
        List<Link> links = new ArrayList<Link>();
        for (Cooperater cooperater : everyYearCollaborators) {
            Node node = new Node();
            node.setId(cooperater.getIndex());
            node.setName(cooperater.getName());
            node.setSize(String.valueOf(cooperater.getCount()));
            node.setColor("CCFF66");
            node.setQindex(cooperater.getQindex());
            node.setHindex(scholar.getHindex());
            node.setAff(scholar.getAff());
            node.setStudyField(scholar.getFieldName());
            nodes.add(node);

            Link link = new Link();
            link.setSource(scholarId);
            link.setTarget(cooperater.getIndex());
            link.setTime(cooperater.getYear());
            links.add(link);
        }

        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }
}

package org.thealpha.controller;

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

import javax.servlet.http.HttpSession;
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

    @RequestMapping("/relationGraph/{scholarId}/{type}")
    public String index(@PathVariable String scholarId, @PathVariable String type, Model model) {
        model.addAttribute("scholarId", scholarId);
        model.addAttribute("type", type);
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


}

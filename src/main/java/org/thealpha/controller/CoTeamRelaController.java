package org.thealpha.controller;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thealpha.model.*;
import org.thealpha.service.ScholarCoTeamService;
import org.thealpha.service.ScholarInfoService;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.JedisCluster;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Controller
public class CoTeamRelaController {

    @Autowired
    private ScholarCoTeamService scholarCoTeamService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @Resource
    private JedisCluster jedisCluster;

    @RequestMapping("/coTeamRela/{scholarId}")
    public String getCoTeamMember(@PathVariable String scholarId, Model model) {
        List<Cooperater> coTeamers = scholarCoTeamService.getCoTeamersById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);
        model.addAttribute("coTeamers", coTeamers);
        model.addAttribute("middleScholar", scholar);
        return "coTeamRela";
    }

    @RequestMapping("/team/{scholarId}/{teamType}")
    public String teamGraph(@PathVariable String scholarId, Model model, @PathVariable String teamType) {
        model.addAttribute("scholarId", scholarId);
        model.addAttribute("teamType", teamType);
//        return "team";
//        return "cooperate";
        return "relationGraph";
    }

    @RequestMapping("/teamJSON/{scholarId}/{teamType}")
    @ResponseBody
    public Graph getTeamJSON(@PathVariable String scholarId, @PathVariable String teamType) {
        Graph g = (Graph) ListTranscoder.deserialize(jedisCluster.hget(ConfigurationConstant.REDIS_AUTHORID_TEAM_GRAPH.getBytes(), (scholarId + teamType).getBytes()));
        if (g != null) {
            return g;
        }
        List<Cooperater> coTeamers = scholarCoTeamService.getCoTeamersById(scholarId);
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
        double limitIntension = 6;
        if ("weakTeam".equals(teamType)) {
            limitIntension = 6;
        } else if ("middleTeam".equals(teamType)) {
            limitIntension = 8;
        } else {
            limitIntension = 10;
        }
        setAllNextNodes(scholarId, coTeamers, visitedNodes, visitedEdges, nodes, links, limitIntension);

        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        jedisCluster.hset(ConfigurationConstant.REDIS_AUTHORID_TEAM_GRAPH.getBytes(), (scholarId + teamType).getBytes(), ListTranscoder.serialize(graph));
        return graph;
    }

    public void setAllNextNodes(String scholarId, List<Cooperater> coTeamers, List<String> visitedNodes, List<String> visitedEdges, List<Node> nodes, List<Link> links, double limitIntension) {
        if (CollectionUtils.isEmpty(coTeamers)) {
            return;
        }
        for (Cooperater coTeamer : coTeamers) {
            if (!visitedNodes.contains(coTeamer.getIndex()) && (coTeamer.getIntension() > limitIntension)) {
                visitedNodes.add(coTeamer.getIndex());

                Node node = new Node();
                node.setId(coTeamer.getIndex());
                node.setName(coTeamer.getName());
                node.setSize(String.valueOf(coTeamer.getIntension()));
                node.setQindex(coTeamer.getQindex());
                node.setHindex(coTeamer.getHindex());
                node.setAff(coTeamer.getAff());
                node.setStudyField(coTeamer.getFieldName());
                if (coTeamer.getIntension() > 10) {
                    node.setColor("#CCFF66");
                } else {
                    node.setColor("#66CCCC");
                }
                nodes.add(node);

                List<Cooperater> subCoTeamers = scholarCoTeamService.getCoTeamersById(coTeamer.getIndex());
                setAllNextNodes(coTeamer.getIndex(), subCoTeamers, visitedNodes, visitedEdges, nodes, links, limitIntension);
            }
            if (!visitedEdges.contains(scholarId + ", " + coTeamer.getIndex())) {
                visitedEdges.add(scholarId + ", " + coTeamer.getIndex());
                Link link = new Link();
                link.setSource(scholarId);
                link.setTarget(coTeamer.getIndex());
                link.setCoCount((int)coTeamer.getIntension());
                links.add(link);
            }
        }
    }

}

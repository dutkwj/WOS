package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Graph;
import org.thealpha.model.Link;
import org.thealpha.model.Node;
import org.thealpha.model.Scholar;
import org.thealpha.service.ReferenceService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-16.
 */
@Controller
public class ReferenceController {

    @Autowired
    private ReferenceService referenceService;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    @RequestMapping("/ref/{scholarId}")
    public String referenceRelationship(@PathVariable String scholarId, Model model) {
//        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
//        List<Scholar> refScholars = referenceService.getRefAuthorsByAuthorId(authorId);
//        model.addAttribute("middleScholar", middleScholar);
//        model.addAttribute("refScholars", refScholars);
//        return "refRela";
        model.addAttribute("scholarId", scholarId);
        model.addAttribute("refType", "ref");
//        return "cooperate";
        return "refrefed_net";
    }

    @RequestMapping("/refJSON/{scholarId}")
    @ResponseBody
    public Graph getRefJSON(@PathVariable String scholarId) {
        Scholar middleScholar = scholarInfoDao.getScholarById(scholarId);
        List<Scholar> refScholars = referenceService.getRefAuthorsByAuthorId(scholarId);
        List<Scholar> refedScholars = referenceService.getRefedAuthorsByAuthorId(scholarId);
        List<Node> nodes = new ArrayList<Node>();
        List<Link> links = new ArrayList<Link>();
        List<String> visitedNodes = new ArrayList<String>();

        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(middleScholar.getName());
        midNode.setSize(String.valueOf(refedScholars.size()));
        midNode.setColor(String.valueOf(refScholars.size()));
        midNode.setQindex(middleScholar.getQindex());
        midNode.setHindex(middleScholar.getHindex());
        midNode.setAff(middleScholar.getAff());
        midNode.setStudyField(middleScholar.getFieldName());
        nodes.add(midNode);
        visitedNodes.add(scholarId);

        for (Scholar refScholar : refScholars) {
            if (visitedNodes.contains(refScholar.getIndex())) {
                continue;
            }
            visitedNodes.add(refScholar.getIndex());
            Node refNode = new Node();
            refNode.setId(refScholar.getIndex());
            refNode.setName(refScholar.getName());
            refNode.setSize("5");
            if (refScholar.getCount() > 10) {
                refNode.setColor("#CCFF66");
            } else {
                refNode.setColor("#66CCCC");
            }
            refNode.setQindex(refScholar.getQindex());
            refNode.setHindex(refScholar.getHindex());
            refNode.setAff(refScholar.getAff());
            refNode.setStudyField(refScholar.getFieldName());
            nodes.add(refNode);

            Link link = new Link();
            link.setSource(scholarId);
            link.setTarget(refScholar.getIndex());
            link.setCoCount(1);
            links.add(link);
        }

        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }

    @RequestMapping("/refed/{scholarId}")
    public String referencedRelationship(@PathVariable String scholarId, Model model) {
//        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
//        List<Scholar> refedScholars = referenceService.getRefedAuthorsByAuthorId(authorId);
//        model.addAttribute("middleScholar", middleScholar);
//        model.addAttribute("refedScholars", refedScholars);
//        return "refedRela";
        model.addAttribute("scholarId", scholarId);
        model.addAttribute("refType", "refed");
//        return "cooperate";
        return "relationGraph";
    }

    @RequestMapping("/refedJSON/{scholarId}")
    @ResponseBody
    public Graph getRefedJSON(@PathVariable String scholarId) {
        Scholar middleScholar = scholarInfoDao.getScholarById(scholarId);
        List<Scholar> refedScholars = referenceService.getRefedAuthorsByAuthorId(scholarId);
        List<Node> nodes = new ArrayList<Node>();
        List<Link> links = new ArrayList<Link>();
        List<String> visitedNodes = new ArrayList<String>();

        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(middleScholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(middleScholar.getQindex());
        midNode.setHindex(middleScholar.getHindex());
        midNode.setAff(middleScholar.getAff());
        midNode.setStudyField(middleScholar.getFieldName());
        nodes.add(midNode);
        visitedNodes.add(scholarId);

        for (Scholar refedScholar : refedScholars) {
            if (visitedNodes.contains(refedScholar.getIndex())) {
                continue;
            }
            visitedNodes.add(refedScholar.getIndex());
            Node refedNode = new Node();
            refedNode.setId(refedScholar.getIndex());
            refedNode.setName(refedScholar.getName());
            refedNode.setSize("5");
            if (refedScholar.getCount() > 10) {
                refedNode.setColor("#CCFF66");
            } else {
                refedNode.setColor("#66CCCC");
            }
            refedNode.setQindex(refedScholar.getQindex());
            refedNode.setHindex(refedScholar.getHindex());
            refedNode.setAff(refedScholar.getAff());
            refedNode.setStudyField(refedScholar.getFieldName());
            nodes.add(refedNode);

            Link link = new Link();
            link.setSource(scholarId);
            link.setTarget(refedScholar.getIndex());
            link.setCoCount(1);
            links.add(link);
        }

        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }

    @RequestMapping("/coRef/{scholarId}")
    public String coReferencRelationship(@PathVariable String scholarId, Model model) {
//        這部分是旧的代码
//        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
//        List<Scholar> coRefScholars = referenceService.getCoRefAuthorsByAuthorId(authorId);
//        model.addAttribute("middleScholar", middleScholar);
//        model.addAttribute("coRefScholars", coRefScholars);
//        return "coRefRela";

        model.addAttribute("scholarId", scholarId);
        model.addAttribute("refType", "coRef");
//        return "ref";
//        return "cooperate";
        return "relationGraph";
    }

    @RequestMapping("/coRefJSON/{scholarId}")
    @ResponseBody
    public Graph getCoRefJSON(@PathVariable String scholarId) {
        Scholar middleScholar = scholarInfoDao.getScholarById(scholarId);
        List<Scholar> coRefScholars = referenceService.getCoRefAuthorsByAuthorId(scholarId);
        List<Node> nodes = new ArrayList<Node>();
        List<Link> links = new ArrayList<Link>();
        List<String> visitedNodes = new ArrayList<String>();
        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(middleScholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(middleScholar.getQindex());
        midNode.setHindex(middleScholar.getHindex());
        midNode.setAff(middleScholar.getAff());
        midNode.setStudyField(middleScholar.getFieldName());
        nodes.add(midNode);
        visitedNodes.add(scholarId);
        int max = 0;

        for (Scholar coRefScholar : coRefScholars) {
            if (max < coRefScholar.getCoRefNumber()) {
                max = coRefScholar.getCoRefNumber();
            }
            if (visitedNodes.contains(coRefScholar.getIndex())) {
                continue;
            }
            visitedNodes.add(coRefScholar.getIndex());
            Node coRefNode = new Node();
            coRefNode.setId(coRefScholar.getIndex());
            coRefNode.setName(coRefScholar.getName());
            coRefNode.setSize(String.valueOf(coRefScholar.getCount()));
            if (coRefScholar.getCount() > 10) {
                coRefNode.setColor("#CCFF66");
            } else {
                coRefNode.setColor("#66CCCC");
            }
            coRefNode.setQindex(coRefScholar.getQindex());
            coRefNode.setHindex(coRefScholar.getHindex());
            coRefNode.setAff(coRefScholar.getAff());
            coRefNode.setStudyField(coRefScholar.getFieldName());
            nodes.add(coRefNode);

            Link link = new Link();
            link.setSource(scholarId);
            link.setTarget(coRefScholar.getIndex());
            link.setCoCount(1);
            links.add(link);
        }

        System.out.println(max);
        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }

    @RequestMapping("/coRefed/{scholarId}")
    public String coReferencedRelationship(@PathVariable String scholarId, Model model) {
//        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
//        List<Scholar> coRefedScholars = referenceService.getCoRefedAuthorsByAuthorId(authorId);
//        model.addAttribute("middleScholar", middleScholar);
//        model.addAttribute("coRefedScholars", coRefedScholars);
//        return "coRefedRela";

        model.addAttribute("scholarId", scholarId);
        model.addAttribute("refType", "coRefed");
//        return "ref";
//        return "cooperate";
        return "relationGraph";
    }

    @RequestMapping("/coRefedJSON/{scholarId}")
    @ResponseBody
    public Graph getCoRefedJSON(@PathVariable String scholarId) {
        Scholar middleScholar = scholarInfoDao.getScholarById(scholarId);
        List<Scholar> coRefedScholars = referenceService.getCoRefedAuthorsByAuthorId(scholarId);
        List<Node> nodes = new ArrayList<Node>();
        List<Link> links = new ArrayList<Link>();
        List<String> visitedNodes = new ArrayList<String>();
        Node midNode = new Node();
        midNode.setId(scholarId);
        midNode.setName(middleScholar.getName());
        midNode.setSize("50");
        midNode.setColor("#FF99CC");
        midNode.setQindex(middleScholar.getQindex());
        midNode.setHindex(middleScholar.getHindex());
        midNode.setAff(middleScholar.getAff());
        midNode.setStudyField(middleScholar.getFieldName());
        nodes.add(midNode);
        visitedNodes.add(scholarId);
        int max = 0;

        for (Scholar coRefedScholar : coRefedScholars) {
            if (max < coRefedScholar.getCoRefedNumber()) {
                max = coRefedScholar.getCoRefedNumber();
            }
            if (visitedNodes.contains(coRefedScholar.getIndex())) {
                continue;
            }
            visitedNodes.add(coRefedScholar.getIndex());
            Node coRefedNode = new Node();
            coRefedNode.setId(coRefedScholar.getIndex());
            coRefedNode.setName(coRefedScholar.getName());
            coRefedNode.setSize(String.valueOf(coRefedScholar.getCount()));
            if (coRefedScholar.getCount() > 10) {
                coRefedNode.setColor("#CCFF66");
            } else {
                coRefedNode.setColor("#66CCCC");
            }
            coRefedNode.setQindex(coRefedScholar.getQindex());
            coRefedNode.setHindex(coRefedScholar.getHindex());
            coRefedNode.setAff(coRefedScholar.getAff());
            coRefedNode.setStudyField(coRefedScholar.getFieldName());
            nodes.add(coRefedNode);

            Link link = new Link();
            link.setSource(scholarId);
            link.setTarget(coRefedScholar.getIndex());
            link.setCoCount(1);
            links.add(link);
        }

        System.out.println(max);
        Graph graph = new Graph();
        graph.setNodes(nodes);
        graph.setLinks(links);
        return graph;
    }
}

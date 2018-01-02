package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;
import org.thealpha.service.ScholarCoTeamService;
import org.thealpha.service.ScholarCooperateService;
import org.thealpha.service.ScholarInfoService;

import java.util.List;


@Controller
public class CoTeamRelaController {

    @Autowired
    private ScholarCoTeamService scholarCoTeamService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/coTeamRela/{scholarId}")
    public String getCoTeamMember(@PathVariable String scholarId, Model model) {
        List<Cooperater> coTeamers = scholarCoTeamService.getCoTeamersById(scholarId);
        Scholar scholar = scholarInfoService.getScholarById(scholarId);
        model.addAttribute("coTeamers", coTeamers);
        model.addAttribute("middleScholar", scholar);
        return "coTeamRela.ftl";
    }
}

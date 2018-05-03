package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;
import org.thealpha.model.User;
import org.thealpha.model.YearCount;
import org.thealpha.service.RecommendService;
import org.thealpha.service.ScholarCooperateService;
import org.thealpha.service.ScholarInfoService;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class CooperateRelaController {

    @Autowired
    private ScholarCooperateService scholarCooperateService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @Autowired
    private RecommendService recommendService;

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
        return "cooperateRela";
    }

    @RequestMapping("/flights")
    public String flights() {
        return "flights";
    }
}

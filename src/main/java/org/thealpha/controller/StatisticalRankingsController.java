package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thealpha.model.Scholar;
import org.thealpha.service.RankService;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-22.
 */
@Controller
@RequestMapping("/rank")
public class StatisticalRankingsController {

    @Autowired
    private RankService rankService;

    @RequestMapping("/index")
    public String index(Model model) {
        List<Scholar> top100Scholars = rankService.getTop100Cooperators();
        model.addAttribute("scholars", top100Scholars);
        return "statisticalRankings";
    }

    @RequestMapping("/top100")
    public String getScholarsByType(@RequestParam String type, Model model) {
        List<Scholar> top100Scholars = null;
        int number = 0;
        if ("cooperator number".equals(type)) {
            top100Scholars = rankService.getTop100Cooperators();
        } else if ("team members".equals(type)) {
            top100Scholars = rankService.getTop100TeamMembers();
        } else if ("students number".equals(type)) {
            top100Scholars = rankService.getTop100Students();
        } else if ("reference number".equals(type)) {
            top100Scholars = rankService.getTop100RefNumber();
        } else if ("referenced number".equals(type)) {
            top100Scholars = rankService.getTop100RefedNumber();
        } else if ("common reference number".equals(type)) {
            top100Scholars = rankService.getTop100CoRef();
        } else if ("common referenced number".equals(type)) {
            top100Scholars = rankService.getTop100CoRefed();
        }
        model.addAttribute("scholars", top100Scholars);
        model.addAttribute("type", type);
        return "scholarRank";
    }
}

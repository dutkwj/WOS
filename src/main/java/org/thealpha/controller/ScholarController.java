package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thealpha.model.Scholar;
import org.thealpha.model.User;
import org.thealpha.service.RecommendService;
import org.thealpha.service.ScholarInfoService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/scholar")
public class ScholarController {

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/baseInfo")
    public String baseInfo(@RequestParam String authorId, Model model) {
        Scholar scholar = scholarInfoService.getScholarById(authorId);
        model.addAttribute("middleScholar", scholar);
//        return "scholar";
        return "scholarInfo";
    }

//    @RequestMapping("/personalInfo/{scholarId}")
//    @ResponseBody
//    public String getPersonalInfo(@PathVariable String scholarId) {
//
//    }
}

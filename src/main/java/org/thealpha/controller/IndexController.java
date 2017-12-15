package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Scholar;
import org.thealpha.service.ScholarCooperateService;
import org.thealpha.service.ScholarInfoService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

    @Autowired
    private ScholarCooperateService scholarCooperateService;

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/index")
    public String helloWorld(@ModelAttribute("test") String test, Model model)
    {
        Map<String, Scholar> recommendScholars = scholarInfoService.getRecommendScholars();
        for (Map.Entry entry : recommendScholars.entrySet()) {
            Scholar scholar = (Scholar)entry.getValue();
            System.out.println(entry.getKey()+" "+scholar.getAff());
        }
        model.addAttribute("recommendScholars", recommendScholars);
        return "index.ftl";
    }
}

package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Scholar;
import org.thealpha.service.ScholarInfoService;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/index")
    public String helloWorld(Model model)
    {
        List<Scholar> recommendScholars = scholarInfoService.getRecommendScholars();
        model.addAttribute("scholars", recommendScholars);
        return "index";
    }
}

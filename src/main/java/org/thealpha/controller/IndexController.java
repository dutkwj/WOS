package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Scholar;
import org.thealpha.model.User;
import org.thealpha.service.RecommendService;
import org.thealpha.service.ScholarInfoService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ScholarInfoService scholarInfoService;

    @Autowired
    private RecommendService recommendService;

    @RequestMapping("/index")
    public String helloWorld(Model model, HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        List<Scholar> recommendScholars = null;
        if (user != null) {
            recommendScholars = recommendService.getRecommendScholar(user.getEmail());
        } else {
            recommendScholars = scholarInfoService.getRecommendScholars();
        }
        model.addAttribute("scholars", recommendScholars);
        return "index";
    }
}

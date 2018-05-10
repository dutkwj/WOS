package org.thealpha.controller;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Scholar;
import org.thealpha.model.User;
import org.thealpha.service.RecommendService;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private RecommendService recommendService;

    @RequestMapping("/index")
    public String helloWorld(Model model, HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        List<Scholar> recommendScholars = null;
        if (user != null) {
            recommendScholars = recommendService.getRecommendScholar(user.getEmail());
        }
        if (CollectionUtils.isEmpty(recommendScholars)) {
            recommendScholars = recommendService.getHindexTop10Scholars();
        }
        model.addAttribute("scholars", recommendScholars);
//        return "index";
        return "home";
    }
}

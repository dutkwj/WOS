package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartnerCountController {
    @RequestMapping("/partnerCountEveYear")
    public String helloWorld(Model model) {
        return "partnerCountEveYear";
    }
}

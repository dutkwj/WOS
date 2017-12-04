package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PotentialController {
    @RequestMapping("/potential")
    public String helloWorld(Model model){
        return "potential.ftl";
    }
}

package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
public class TuringController {
    @RequestMapping("/Turing")
    public String helloWorld(Model model){
        return "Test";
    }
}

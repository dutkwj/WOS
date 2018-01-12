package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
public class InforController {
    @RequestMapping("/information")
    public String helloword(Model model){
        return "information";
    }

}

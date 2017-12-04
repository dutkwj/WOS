package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
    @RequestMapping("/register")
    public String helloWord(Model modle){
        return "register.ftl";
    }
}

package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String helloWord(Model modle){
        return "login.ftl";
    }

    @RequestMapping("/test")
    public String test(Model modle){
        return "Test.ftl";
    }
}

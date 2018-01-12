package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
    @RequestMapping("/index")
    public String index(Model modle){
        return "login.ftl";
    }

    @RequestMapping("/verify")
    public String login(Model model, String username, String password, String data) {
        model.addAttribute("loginerror", "username or password is wrong");
        return "login.ftl";
    }

    @RequestMapping("/test")
    public String test(Model modle){
        return "Test.ftl";
    }
}

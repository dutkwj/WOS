package org.thealpha.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.thealpha.model.User;
import org.thealpha.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class LoginOutController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login/index")
    public String index(){
        return "login";
    }

    @RequestMapping("/login/verify")
    public ModelAndView login(Model model, String email, String password, HttpSession session) {
        if (StringUtils.isBlank(email)) {
            model.addAttribute("loginerror", "email is empty, please input email.");
            return new ModelAndView("login");
        }
        if (StringUtils.isBlank(password)) {
            model.addAttribute("loginerror", "password is empty, please input password.");
            return new ModelAndView("login");
        }
        if (!userService.verifyUser(email, password)) {
            model.addAttribute("loginerror", "email or password is wrong, please input again.");
            return new ModelAndView("login");
        }
        User user = userService.getUserNameAndPhotoNameByEmail(email);
        session.setAttribute("user", user);
        return new ModelAndView("redirect:/index");
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/login/index";
    }

    @RequestMapping("/test")
    public String test(){
        return "redirect:/login/index";
    }
}

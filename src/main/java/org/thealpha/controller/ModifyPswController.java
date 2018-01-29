package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.thealpha.model.User;
import org.thealpha.service.UserService;

import javax.servlet.http.HttpSession;
import javax.swing.*;

@Controller
@RequestMapping("/modifyPsw")
public class ModifyPswController {
    @Autowired
    private UserService userservice;
    @RequestMapping("/modifyPage")
    public String modifyPage(Model model){
        return "modifyPsw";
    }
    @RequestMapping("/modify")
    public String modifyPassword(Model model,User user, HttpSession session){
        User usere = (User)session.getAttribute("user");
//        User userInfo = userservice.getUserInfoByEmail(user.getEmail());
        user.setEmail(usere.getEmail());
//        System.out.println("############################"+user.getPassword()+"^^^^^^^"+user.getEmail());
        boolean y = userservice.modifyPsd(user);
        if(y){
            Object[] options = { "确定"};
            JOptionPane.showOptionDialog(null, "修改成功 ", "提示",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE,
                    null, options, options[0]);
            return "redirect:/login/index";

        }else {
            Object[] options = { "确定"};
            JOptionPane.showOptionDialog(null, "修改失败 ", "提示",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE,
                    null, options, options[0]);
            return "redirect:/modifyPsw/modifyPage";
        }
    }

}

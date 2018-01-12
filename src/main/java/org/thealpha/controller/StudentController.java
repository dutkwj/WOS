package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
public class StudentController {

    @RequestMapping("/helloWorld")
    public String helloWorld(Model model) {
        String word0 = "Hello ";
        String word1 = "World!";
        System.out.println(word0);
        //将数据添加到视图数据容器中
        model.addAttribute("word0",word0);
        model.addAttribute("word1",word1);
        return "Hello";
    }
}
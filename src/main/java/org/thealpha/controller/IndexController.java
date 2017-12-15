package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.service.ScholarCooperateService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

    @Autowired
    private ScholarCooperateService scholarCooperateService;
    @RequestMapping("/index")
    public String helloWorld(@ModelAttribute("test") String test, Model model)
    {
        test = "123";
        List<String> testList = new ArrayList<String>();
        testList.add("123");
        testList.add("456");
        Map<String, String> map = new HashMap<String, String>();
        map.put("key", "value");
        map.put("test123","test123");
        model.addAllAttributes(testList);
        model.addAllAttributes(map);
        model.addAttribute("map", map);
        model.addAttribute("abc", "abc123");
        model.addAttribute("testList", testList);
        Map<String, String> scholarCooperate = scholarCooperateService.getAllCooperate();
        model.addAllAttributes(scholarCooperate);
        model.addAttribute("scholarCooperate", scholarCooperate);
        return "index.ftl";
    }
}

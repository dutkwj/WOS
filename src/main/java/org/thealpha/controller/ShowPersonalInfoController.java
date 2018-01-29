package org.thealpha.controller;



import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.thealpha.model.User;
import org.thealpha.service.RegisterService;
import org.thealpha.service.UserService;
import org.xml.sax.helpers.AttributesImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;


@Controller
@RequestMapping("/showPersonalInfo")
public class ShowPersonalInfoController {

    @Autowired
    private UserService userService;
    @Autowired
    private RegisterService registerService;

    @RequestMapping("/getUserInfo")
    public String getUserInfoByEmail(Model model, HttpSession session){

        User user =  (User)(session.getAttribute("user"));
//        System.out.println("////////?!!!!!!!!!!!!" + user.getEmail());

        User UserInfo = userService.getUserInfoByEmail(user.getEmail());
//        System.out.println("////////?!!!!!!!!!!!!" + UserInfo);
        List<String> countryNames = registerService.getAllCountriesName();
        model.addAttribute("countryNames", countryNames);
        model.addAttribute("userInfo",UserInfo);

        return "showPersonalInfo";

    }
    @RequestMapping("/modifyInfo")
    public String modifyInfo(Model model,User user,HttpSession session,HttpServletResponse response) throws JSONException, IOException {
//        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+user);
        User users = (User)(session.getAttribute("user"));
        user.setEmail(users.getEmail());
//        System.out.println("################################################"+user);
        boolean b = userService.modifyInfo(user);
        JSONObject result = new JSONObject();
        if(b){
            result.put("success", "Success");
        }else{
            result.put("success","Failure");
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
        return "showPersonalInfo";
    }


}

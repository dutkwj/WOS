package org.thealpha.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.thealpha.model.User;
import org.thealpha.service.RegisterService;

import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/index")
    public String register(Model modle){
        List<String> countryNames = registerService.getAllCountriesName();
        modle.addAttribute("countryNames", countryNames);
        return "register.ftl";
    }

    @RequestMapping("/addUser")
    public String addScholar(User user, @RequestParam("file") MultipartFile personalPhoto) throws IOException {
        if (StringUtils.isBlank(user.getEmail())) {
            return null;
        }
        String uuid = UUID.randomUUID().toString().replace("-", "");
        user.setIndex(uuid);
        String photoName = personalPhoto.getOriginalFilename();
        user.setPersonalPhoto(photoName);
        FileOutputStream fos = new FileOutputStream(new File("../photo/" + uuid + "" + photoName.substring(photoName.indexOf("."))));
        FileInputStream fis = (FileInputStream) personalPhoto.getInputStream();
        byte[] read = new byte[1024];
        int len = 0;
        while((len = fis.read(read))!= -1){
            fos.write(read,0,len);
        }
        fis.close();
        fos.flush();
        fos.close();

        registerService.saveUser(user);
        return "registerSuccess.ftl";
    }

    @RequestMapping("/success")
    public String registerSuccess(){
        return "registerSuccess.ftl";
    }
}

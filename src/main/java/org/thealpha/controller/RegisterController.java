package org.thealpha.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.thealpha.model.User;
import org.thealpha.service.RegisterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/index")
    public String register(Model modle, HttpServletRequest request){
        List<String> countryNames = registerService.getAllCountriesName();
        modle.addAttribute("countryNames", countryNames);
        File file = new File("a.jpg");
        String filePath = file.getAbsolutePath();
        System.out.println(file.exists());
        System.out.println(filePath);

        return "register";
    }

    @RequestMapping("/addUser")
    public String addScholar(User user, @RequestParam("file") MultipartFile personalPhoto, Model model) {
        if (StringUtils.isBlank(user.getEmail())) {
            List<String> countryNames = registerService.getAllCountriesName();
            model.addAttribute("countryNames", countryNames);
            return "register";
        } else {
            if (registerService.isEmailExist(user.getEmail())) {
                List<String> countryNames = registerService.getAllCountriesName();
                model.addAttribute("countryNames", countryNames);
                model.addAttribute("registerError", user.getEmail() + " has been registered!");
                return "register";
            }
        }
        String uuid = UUID.randomUUID().toString().replace("-", "");
        user.setIndex(uuid);
        String photoName = personalPhoto.getOriginalFilename();
        try {
            if (StringUtils.isNotBlank(photoName)) {
                Configuration configuration = new Configuration();
                configuration.set("fs.default.name", "hdfs://100.66.1.209:9000");
                FileSystem fileSystem = FileSystem.get(configuration);
                photoName = uuid + photoName.substring(photoName.indexOf("."));
                OutputStream outputStream = fileSystem.create(new Path("/hbase/photo/" + photoName));

                user.setPersonalPhoto(photoName);
                InputStream inputStream = personalPhoto.getInputStream();
                byte[] read = new byte[1024];
                int len = 0;
                while((len = inputStream.read(read))!= -1){
                    outputStream.write(read,0,len);
                }
                inputStream.close();
                outputStream.flush();
                outputStream.close();
                fileSystem.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        registerService.saveUser(user);
        return "registerSuccess";
    }

    @RequestMapping("/success")
    public String registerSuccess(){
        return "registerSuccess";
    }
}

package org.thealpha.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.User;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@Controller
@RequestMapping("/hdfs")
public class HdfsController {

    @RequestMapping("/personalPhoto")
    public void getImg(HttpServletResponse response, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return;
        }
        if (StringUtils.isBlank(user.getPersonalPhoto())) {
            user.setPersonalPhoto("scholarImg.png");
        }
        Configuration configuration = new Configuration();
        configuration.set("fs.default.name", "hdfs://100.66.1.209:9000");
        FileSystem fileSystem = null;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            fileSystem = FileSystem.get(configuration);
            inputStream = fileSystem.open(new Path("/hbase/photo/" + user.getPersonalPhoto()));
            outputStream = response.getOutputStream();
            int count = 0;
            byte[] buffer = new byte[1024 * 8];
            while ((count = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, count);
                outputStream.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
                inputStream.close();
                fileSystem.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.thealpha.controller.CreateHtml;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;


//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:spring-servlet.xml"})
public class Test{
    @org.junit.Test
    public void test2() throws IOException{
//        File countryFile = new File("/home/kangwenjie/IdeaProjects/WOS/src/main/webapp/file/CountryName.txt");  // CSV文件路径
//        BufferedReader br = null;
//        try {
//            br = new BufferedReader(new FileReader(countryFile));
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        }
//        String line = "";
//        StringBuilder countryNames = new StringBuilder();
//        while ((line = br.readLine()) != null) {
//            String name = line.replace("\"", "").split("-")[0];
//
//            System.out.println(line);
//            System.out.println(name);
//            countryNames.append(name + ",");
//
//        }
//        br.close();
//
//        File countryFile2 = new File("/home/kangwenjie/IdeaProjects/WOS/src/main/webapp/file/CountryName2.txt");  // CSV文件路径
//
//        BufferedWriter bw = new BufferedWriter(new FileWriter(countryFile2));
//        bw.write(countryNames.toString());
//        bw.close();
        for(int i=0;i<10;i++){
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println(uuid);
        }
    }



}

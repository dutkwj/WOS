package org.thealpha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Scholar;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 18-4-9.
 */

@Controller
public class WorldMapController {

    @RequestMapping("/worldmap/csScholar")
    public String allCsScholar(Model model) throws IOException {
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_index_lat_lng.csv");
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String line = "";
        List<Scholar> scholars = new ArrayList<Scholar>();
        try {
            while ((line = br.readLine()) != null)
            {
                String latlng = line.substring(line.indexOf(",") + 1);
                latlng = latlng.replaceAll("\"", "");
                int commaIndex = latlng.indexOf(", ");
                Scholar scholar = new Scholar();
                scholar.setLatitude(latlng.substring(0, commaIndex));
                scholar.setLongitude(latlng.substring(commaIndex + 1));
                scholars.add(scholar);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            br.close();
        }
        model.addAttribute("scholars", scholars);
        return "worldMap";
    }
}

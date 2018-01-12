package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.model.Scholar;
import org.thealpha.model.SearchItem;
import org.thealpha.service.ScholarInfoService;

import java.io.IOException;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-19.
 */
@Controller
@RequestMapping("/searchMore")
public class SearchController {

    @Autowired
    private ScholarInfoService scholarInfoService;

    @RequestMapping("/index")
    public String searchMoreIndex(Model model) {
        List<Scholar> moreRecommendScholars = scholarInfoService.getMoreRecommendScholars();
        model.addAttribute("scholars", moreRecommendScholars);
        return "searchMore";
    }

    @RequestMapping("/content")
    public String getContentBySearchItems(Model model, SearchItem searchItem) {
        List<Scholar> searchScholars = null;
        try {
            searchScholars = scholarInfoService.getScholarsBySearchItems(searchItem);
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("scholars", searchScholars);
        return "searchMore";
    }

}

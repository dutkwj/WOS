package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thealpha.model.Scholar;
import org.thealpha.model.SearchItem;
import org.thealpha.service.RecommendService;
import org.thealpha.service.ScholarInfoService;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-19.
 */
@Controller
@RequestMapping("/searchMore")
public class SearchController {

    @Autowired
    private ScholarInfoService scholarInfoService;

    @Autowired
    private RecommendService recommendService;

    @RequestMapping("/index")
    public String searchMoreIndex(Model model) {
        List<Scholar> moreRecommendScholars = recommendService.getHindexTop100Scholars();
        model.addAttribute("scholars", moreRecommendScholars);
//        return "searchMore";
        return "searchIndex";
    }

    @RequestMapping("/content")
    public String getContentBySearchItems(Model model, SearchItem searchItem) {
        List<Scholar> searchScholars = null;
        try {
            searchScholars = scholarInfoService.getScholarsBySearchItems(searchItem);
        } catch (IOException e) {
            e.printStackTrace();
        }
//        用来展示的前100名学者
        if (searchScholars.size() > 100) {
            model.addAttribute("scholars", searchScholars.subList(0, 100));
        } else
//        隐藏的200名学者，用来做排序，前100为降序，后100为升序
        model.addAttribute("hiddenScholars", searchScholars);
//        return "searchMore";
        return "searchIndex";
    }

    @RequestMapping("/sort/{sortItem}/{sortType}")
    @ResponseBody
    public List<Scholar> sort(@RequestBody List<Scholar> scholars, @PathVariable String sortItem, @PathVariable String sortType) {
        if ("q_index".equals(sortItem)) {
            if ("up".equals(sortType)) {
                Collections.sort(scholars, new Comparator<Scholar>() {
                    @Override
                    public int compare(Scholar o1, Scholar o2) {
                        if (o1.getQindex() < o2.getQindex()) {
                            return -1;
                        } else if (o1.getQindex() > o2.getQindex()) {
                            return 1;
                        }
                        return 0;
                    }
                });
            } else {
                Collections.sort(scholars, new Comparator<Scholar>() {
                    @Override
                    public int compare(Scholar o1, Scholar o2) {
                        if (o1.getQindex() < o2.getQindex()) {
                            return 1;
                        } else if (o1.getQindex() > o2.getQindex()) {
                            return -1;
                        }
                        return 0;
                    }
                });
            }

        } else if ("h_index".equals(sortItem)) {
            if ("up".equals(sortType)) {
                Collections.sort(scholars, new Comparator<Scholar>() {
                    @Override
                    public int compare(Scholar o1, Scholar o2) {
                        if (o1.getHindex() < o2.getHindex()) {
                            return -1;
                        } else if (o1.getHindex() > o2.getHindex()) {
                            return 1;
                        }
                        return 0;
                    }
                });
            } else {
                Collections.sort(scholars, new Comparator<Scholar>() {
                    @Override
                    public int compare(Scholar o1, Scholar o2) {
                        if (o1.getHindex() < o2.getHindex()) {
                            return 1;
                        } else if (o1.getHindex() > o2.getHindex()) {
                            return -1;
                        }
                        return 0;
                    }
                });
            }

        }
        if (scholars.size() > 100) {
            scholars = scholars.subList(0, 100);
        }
        return scholars;
    }

}

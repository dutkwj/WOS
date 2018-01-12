package org.thealpha.controller;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;
import org.thealpha.service.ReferenceService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-16.
 */
@Controller
@RequestMapping("/reference")
public class ReferenceController {

    @Autowired
    private ReferenceService referenceService;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    @RequestMapping("/ref/{authorId}")
    public String referenceRelationship(@PathVariable String authorId, Model model) {
        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
        List<Scholar> refScholars = referenceService.getRefAuthorsByAuthorId(authorId);
        model.addAttribute("middleScholar", middleScholar);
        model.addAttribute("refScholars", refScholars);
        return "refRela";
    }

    @RequestMapping("/refed/{authorId}")
    public String referencedRelationship(@PathVariable String authorId, Model model) {
        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
        List<Scholar> refedScholars = referenceService.getRefedAuthorsByAuthorId(authorId);
        model.addAttribute("middleScholar", middleScholar);
        model.addAttribute("refedScholars", refedScholars);
        return "refedRela";
    }

    @RequestMapping("/coRef/{authorId}")
    public String coReferencRelationship(@PathVariable String authorId, Model model) {
        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
        List<Scholar> coRefScholars = referenceService.getCoRefAuthorsByAuthorId(authorId);
        model.addAttribute("middleScholar", middleScholar);
        model.addAttribute("coRefScholars", coRefScholars);
        return "coRefRela";
    }

    @RequestMapping("/coRefed/{authorId}")
    public String coReferencedRelationship(@PathVariable String authorId, Model model) {
        Scholar middleScholar = scholarInfoDao.getScholarById(authorId);
        List<Scholar> coRefedScholars = referenceService.getCoRefedAuthorsByAuthorId(authorId);
        model.addAttribute("middleScholar", middleScholar);
        model.addAttribute("coRefedScholars", coRefedScholars);
        return "coRefedRela";
    }
}

package org.thealpha.service;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.PaperDao;
import org.thealpha.dao.inter.ReferenceDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;

import java.util.*;

/**
 * Created by kangwenjie on 17-12-16.
 */
@Service
public class ReferenceService {

    @Autowired
    private ReferenceDao referenceDao;

    @Autowired
    private PaperDao paperDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    public List<Scholar> getRefAuthorsByAuthorId(String authorId) {
        List<String> paperIds = paperDao.getPaperIdsByAuthorId(authorId);
        List<String> refPaperIds = referenceDao.getRefPaperIdsByPaperIds(paperIds);
        List<String> authorIds = paperDao.getAuthorIdsByPaperIds(refPaperIds);
        return scholarInfoDao.getScholarsByIds(authorIds);
    }

    public List<Scholar> getRefedAuthorsByAuthorId(String authorId) {
        List<String> paperIds = paperDao.getPaperIdsByAuthorId(authorId);
        List<String> refedPaperIds = referenceDao.getRefedPaperIdsByPaperIds(paperIds);
        List<String> authorIds = paperDao.getAuthorIdsByPaperIds(refedPaperIds);
        return scholarInfoDao.getScholarsByIds(authorIds);
    }

    public List<Scholar> getCoRefAuthorsByAuthorId(String authorId) {
        List<String> paperIds = paperDao.getPaperIdsByAuthorId(authorId);
//        获得共同引用的论文和数量
        List<String> coRefPapers = referenceDao.getCoRefPapersByPaperIds(paperIds);
        Map<String, Integer> paperIdCount = new HashMap<String, Integer>();
//        获得论文与数量之间的对应关系
        for (String coRefPaper : coRefPapers) {
            String refPaperId = coRefPaper.substring(0, coRefPaper.indexOf(":"));
            int count = Integer.parseInt(coRefPaper.substring(coRefPaper.indexOf(":") + 1));
            if (!paperIdCount.containsKey(refPaperId)) {
                paperIdCount.put(refPaperId, count);
            } else {
                paperIdCount.put(refPaperId, paperIdCount.get(refPaperId) + count);
            }
        }
        List<String> paperIdList = new ArrayList<String>(paperIdCount.keySet());
//        获得论文与学者之间的对应关系
        Map<String, List<String>> paperIdAuthorIds = paperDao.getPaperIdAuthorIdsMapByPaperIds(paperIdList);

        Map<String, Integer> authorIdCount = new HashMap<String, Integer>();
//        计算学者与数量之间的对应关系
        for (Map.Entry entry : paperIdAuthorIds.entrySet()) {
            String paperId = (String) entry.getKey();
            List<String> authorIds = paperIdAuthorIds.get(paperId);
            int count = paperIdCount.get(paperId);
            for (String id : authorIds) {
                if (!authorIdCount.containsKey(id)) {
                    authorIdCount.put(id, count);
                } else {
                    authorIdCount.put(id, authorIdCount.get(id) + count);
                }
            }
        }
        List<String> authorIdList = new ArrayList<String>(authorIdCount.keySet());
        List<Scholar> scholars = scholarInfoDao.getScholarsByIds(authorIdList);
        for (Scholar scholar : scholars) {
            scholar.setCount(authorIdCount.get(scholar.getIndex()));
        }
        return scholars;
    }

    public List<Scholar> getCoRefedAuthorsByAuthorId(String authorId) {
        List<String> paperIds = paperDao.getPaperIdsByAuthorId(authorId);
//        获得共同被引用的论文和数量
        List<String> coRefedPapers = referenceDao.getCoRefedPapersByPaperIds(paperIds);
        Map<String, Integer> paperIdCount = new HashMap<String, Integer>();
//        获得论文与数量之间的对应关系
        for (String coRefedPaper : coRefedPapers) {
            String refedPaperId = coRefedPaper.substring(0, coRefedPaper.indexOf(":"));
            int count = Integer.parseInt(coRefedPaper.substring(coRefedPaper.indexOf(":") + 1));
            if (!paperIdCount.containsKey(refedPaperId)) {
                paperIdCount.put(refedPaperId, count);
            } else {
                paperIdCount.put(refedPaperId, paperIdCount.get(refedPaperId) + count);
            }
        }
        List<String> paperIdList = new ArrayList<String>(paperIdCount.keySet());
//        获得论文与学者之间的对应关系
        Map<String, List<String>> paperIdAuthorIds = paperDao.getPaperIdAuthorIdsMapByPaperIds(paperIdList);

        Map<String, Integer> authorIdCount = new HashMap<String, Integer>();
//        计算学者与数量之间的对应关系
        for (Map.Entry entry : paperIdAuthorIds.entrySet()) {
            String paperId = (String) entry.getKey();
            List<String> authorIds = paperIdAuthorIds.get(paperId);
            int count = paperIdCount.get(paperId);
            for (String id : authorIds) {
                if (!authorIdCount.containsKey(id)) {
                    authorIdCount.put(id, count);
                } else {
                    authorIdCount.put(id, authorIdCount.get(id) + count);
                }
            }
        }
        List<String> authorIdList = new ArrayList<String>(authorIdCount.keySet());
        List<Scholar> scholars = scholarInfoDao.getScholarsByIds(authorIdList);
        for (Scholar scholar : scholars) {
            scholar.setCount(authorIdCount.get(scholar.getIndex()));
        }
        return scholars;
    }
}
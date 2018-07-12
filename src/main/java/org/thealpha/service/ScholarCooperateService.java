package org.thealpha.service;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.*;

import javax.annotation.Resource;
import javax.print.attribute.standard.Copies;
//import java.time.Year;
import java.util.*;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Service
public class ScholarCooperateService {

    @Autowired
    private ScholarCooperateDao scholarCooperateDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    public Map<String, String> getAllCooperate() {
        return scholarCooperateDao.getAllCooperateScholar();
    }

    public List<Cooperater> getCooperaterCountById(String scholarId) {
        List<Cooperater> cooperaterList = scholarCooperateDao.getCooperatersById(scholarId);
//        Map<String, Double> map = scholarCooperateDao.getCoIntensitymapById(scholarId);
        List<String> scholarIds = new ArrayList<String>();
        for (Cooperater cooperater : cooperaterList) {
            scholarIds.add(cooperater.getIndex());
        }
        List<Scholar> scholarList = scholarInfoDao.getScholarsByIds(scholarIds);

        Map<String, Scholar> scholarIdObjectMap = new HashMap<String, Scholar>();
        for (Scholar scholar : scholarList) {
            scholarIdObjectMap.put(scholar.getIndex(), scholar);
        }
        for (Cooperater cooperater : cooperaterList) {
            cooperater.setName(scholarIdObjectMap.get(cooperater.getIndex()).getName());
            cooperater.setHindex(scholarIdObjectMap.get(cooperater.getIndex()).getHindex());
            cooperater.setQindex(scholarIdObjectMap.get(cooperater.getIndex()).getQindex());
            cooperater.setAff(scholarIdObjectMap.get(cooperater.getIndex()).getAff());
            cooperater.setLatlng(scholarIdObjectMap.get(cooperater.getIndex()).getLatlng());
            cooperater.setLatitude(scholarIdObjectMap.get(cooperater.getIndex()).getLatitude());
            cooperater.setLongitude(scholarIdObjectMap.get(cooperater.getIndex()).getLongitude());
            cooperater.setFieldName(scholarIdObjectMap.get(cooperater.getIndex()).getFieldName());
            cooperater.setCooperateNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCooperateNumber());
            cooperater.setCoTeamNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCoTeamNumber());
            cooperater.setStudentsNumber(scholarIdObjectMap.get(cooperater.getIndex()).getStudentsNumber());
            cooperater.setPaperNumber(scholarIdObjectMap.get(cooperater.getIndex()).getPaperNumber());
//            if(map.containsKey(cooperater.getIndex())){
//                cooperater.setIntensity(map.get(cooperater.getIndex()));
//            }
        }
        return cooperaterList;
    }

    public List<Cooperater> getCooperaterIntensityById(String scholarId) {
        List<Cooperater> cooperaterList = scholarCooperateDao.getCooperatersIntensityById(scholarId);
        List<String> scholarIds = new ArrayList<String>();
        for (Cooperater cooperater : cooperaterList) {
            scholarIds.add(cooperater.getIndex());
        }
        List<Scholar> scholarList = scholarInfoDao.getScholarsByIds(scholarIds);

        Map<String, Scholar> scholarIdObjectMap = new HashMap<String, Scholar>();
        for (Scholar scholar : scholarList) {
            scholarIdObjectMap.put(scholar.getIndex(), scholar);
        }
        for (Cooperater cooperater : cooperaterList) {
            cooperater.setName(scholarIdObjectMap.get(cooperater.getIndex()).getName());
            cooperater.setHindex(scholarIdObjectMap.get(cooperater.getIndex()).getHindex());
            cooperater.setQindex(scholarIdObjectMap.get(cooperater.getIndex()).getQindex());
            cooperater.setAff(scholarIdObjectMap.get(cooperater.getIndex()).getAff());
            cooperater.setLatlng(scholarIdObjectMap.get(cooperater.getIndex()).getLatlng());
            cooperater.setLatitude(scholarIdObjectMap.get(cooperater.getIndex()).getLatitude());
            cooperater.setLongitude(scholarIdObjectMap.get(cooperater.getIndex()).getLongitude());
            cooperater.setFieldName(scholarIdObjectMap.get(cooperater.getIndex()).getFieldName());
            cooperater.setCooperateNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCooperateNumber());
            cooperater.setCoTeamNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCoTeamNumber());
            cooperater.setStudentsNumber(scholarIdObjectMap.get(cooperater.getIndex()).getStudentsNumber());
            cooperater.setPaperNumber(scholarIdObjectMap.get(cooperater.getIndex()).getPaperNumber());
        }
        return cooperaterList;
    }

    public List<Cooperater> getMVCsById(String scholarId) {
        List<Cooperater> MVCList = scholarCooperateDao.getMVCsById(scholarId);
        List<String> scholarIds = new ArrayList<String>();
        for (Cooperater MVC : MVCList) {
            scholarIds.add(MVC.getIndex());
        }
        List<Scholar> scholarList = scholarInfoDao.getScholarsByIds(scholarIds);

        Map<String, Scholar> scholarIdObjectMap = new HashMap<String, Scholar>();
        for (Scholar scholar : scholarList) {
            scholarIdObjectMap.put(scholar.getIndex(), scholar);
        }
        for (Cooperater MVC : MVCList) {
            MVC.setName(scholarIdObjectMap.get(MVC.getIndex()).getName());
            MVC.setHindex(scholarIdObjectMap.get(MVC.getIndex()).getHindex());
            MVC.setQindex(scholarIdObjectMap.get(MVC.getIndex()).getQindex());
            MVC.setAff(scholarIdObjectMap.get(MVC.getIndex()).getAff());
            MVC.setLatlng(scholarIdObjectMap.get(MVC.getIndex()).getLatlng());
            MVC.setLatitude(scholarIdObjectMap.get(MVC.getIndex()).getLatitude());
            MVC.setLongitude(scholarIdObjectMap.get(MVC.getIndex()).getLongitude());
            MVC.setFieldName(scholarIdObjectMap.get(MVC.getIndex()).getFieldName());
            MVC.setCooperateNumber(scholarIdObjectMap.get(MVC.getIndex()).getCooperateNumber());
            MVC.setCoTeamNumber(scholarIdObjectMap.get(MVC.getIndex()).getCoTeamNumber());
            MVC.setStudentsNumber(scholarIdObjectMap.get(MVC.getIndex()).getStudentsNumber());
        }
        return MVCList;
    }

    public List<YearCount> getCooperateYearCountsById(String scholarId) {
        List<YearCount> yearCounts = scholarCooperateDao.getCooperateYearCountsById(scholarId);
//        去掉1980年之前的，合作者数量在20以上的按20算
        List<Integer> years = new ArrayList<Integer>();
        List<YearCount> removeYearCounts = new ArrayList<YearCount>();
        for (YearCount yearCount: yearCounts) {
            int year = yearCount.getYear();
            int count = yearCount.getCount();
            if (year < 1980) {
                removeYearCounts.add(yearCount);
                continue;
            } else {
                years.add(year);
            }
            if (count > 20) {
                count = 20;
                yearCount.setCount(count);
            }
        }
        if (CollectionUtils.isNotEmpty(removeYearCounts)) {
            yearCounts.removeAll(removeYearCounts);
        }
        for (int i = 1980; i < 2017; i++) {
            if (!years.contains(i)) {
                YearCount yearCount = new YearCount();
                yearCount.setYear(i);
                yearCount.setCount(0);
                yearCounts.add(yearCount);
            }
        }
        Collections.sort(yearCounts, new Comparator<YearCount>() {
            public int compare(YearCount o1, YearCount o2) {
                return new Integer(o1.getYear()).compareTo(new Integer(o2.getYear()));
            }
        });
        return yearCounts;
    }

    //根据学者id查找每年合作数量
    public List<YearConumber> getYearConumbersById(String id){
        List<YearConumber> yearConumberList = scholarCooperateDao.getYearConumbersById(id);
        return yearConumberList;

    }

//    根据学者id和合作强度得到合作者
    public void getCollaboratorsByScholarIdAndCI(String scholarId, List<Cooperater> collaborators, List<String> visitedNodes, List<String> visitedEdges, List<Node> nodes, List<Link> links, double minCI, int depth, int maxDepth) {
        if (CollectionUtils.isEmpty(collaborators)) {
            return;
        }
        for (Cooperater collaborator : collaborators) {
            if (!visitedNodes.contains(collaborator.getIndex()) && (collaborator.getIntensity() > minCI) && (depth < maxDepth)) {
                visitedNodes.add(collaborator.getIndex());

                Node node = new Node();
                node.setId(collaborator.getIndex());
                node.setName(collaborator.getName());
//                node.setSize(String.valueOf(collaborator.getIntensity()));
                node.setQindex(collaborator.getQindex());
                node.setHindex(collaborator.getHindex());
                node.setAff(collaborator.getAff());
                node.setStudyField(collaborator.getFieldName());
                node.setColor("#CCFF66");
                nodes.add(node);

                List<Cooperater> subCollaborators = getCooperaterIntensityById(collaborator.getIndex());
                getCollaboratorsByScholarIdAndCI(collaborator.getIndex(), subCollaborators, visitedNodes, visitedEdges, nodes, links, minCI, depth + 1, maxDepth);
            }
            if (!visitedEdges.contains(scholarId + ", " + collaborator.getIndex()) && (collaborator.getIntensity() > minCI) && (depth < maxDepth)) {
                visitedEdges.add(scholarId + ", " + collaborator.getIndex());
                Link link = new Link();
                link.setSource(scholarId);
                link.setTarget(collaborator.getIndex());
                link.setIntensity(collaborator.getIntensity());
                links.add(link);
            }
        }
    }

    public List<Cooperater> getEveryYearCollaboratorsById(String scholarId) {
        List<Cooperater> cooperaterList = scholarCooperateDao.getEveryYearCollaboratorsById(scholarId);
        List<String> scholarIds = new ArrayList<String>();
        for (Cooperater cooperater : cooperaterList) {
            scholarIds.add(cooperater.getIndex());
        }
        List<Scholar> scholarList = scholarInfoDao.getScholarsByIds(scholarIds);

        Map<String, Scholar> scholarIdObjectMap = new HashMap<String, Scholar>();
        for (Scholar scholar : scholarList) {
            scholarIdObjectMap.put(scholar.getIndex(), scholar);
        }
        for (Cooperater cooperater : cooperaterList) {
            cooperater.setName(scholarIdObjectMap.get(cooperater.getIndex()).getName());
            cooperater.setHindex(scholarIdObjectMap.get(cooperater.getIndex()).getHindex());
            cooperater.setQindex(scholarIdObjectMap.get(cooperater.getIndex()).getQindex());
            cooperater.setAff(scholarIdObjectMap.get(cooperater.getIndex()).getAff());
            cooperater.setLatlng(scholarIdObjectMap.get(cooperater.getIndex()).getLatlng());
            cooperater.setLatitude(scholarIdObjectMap.get(cooperater.getIndex()).getLatitude());
            cooperater.setLongitude(scholarIdObjectMap.get(cooperater.getIndex()).getLongitude());
            cooperater.setFieldName(scholarIdObjectMap.get(cooperater.getIndex()).getFieldName());
            cooperater.setCooperateNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCooperateNumber());
            cooperater.setCoTeamNumber(scholarIdObjectMap.get(cooperater.getIndex()).getCoTeamNumber());
            cooperater.setStudentsNumber(scholarIdObjectMap.get(cooperater.getIndex()).getStudentsNumber());
        }

//        System.out.println(scholarId);
        return cooperaterList;
    }
    public List<String> getCollaboratorsYearById(String scholarId) {
        List<String> cooperateryearList = scholarCooperateDao.getCollaboratorsYearById(scholarId);
        return cooperateryearList;
    }
    public List<Yearnumber> getEveryYearPapernumberById(String scholarId){
        List<Yearnumber> cooperaterList = scholarCooperateDao.getEveryYearPapernumberById(scholarId);
        return cooperaterList;
    }

    public List<YearcooperId> getYearCollaboratorsIndexById(String scholarId) {
        List<Cooperater> cooperaterList = scholarCooperateDao.getEveryYearCollaboratorsById(scholarId);
        List<String> cooperateryear = scholarCooperateDao.getCollaboratorsYearById(scholarId);
        HashMap<String,String> YearCollaboratorsIndexMap = new HashMap<String,String>();
        String index = "";
        List<YearcooperId> YearCollaboratorsIndex = new ArrayList<YearcooperId>();
        for(int j = 0;j < cooperateryear.size();j++){
            index = "";
            for(int i = 0;i < cooperaterList.size() ;i++) {
                if (cooperateryear.get(j).equals(cooperaterList.get(i).getYear())) {
                    index = index + cooperaterList.get(i).getIndex() + ",";
//                    YearCollaboratorsIndexMap.put(cooperateryear.get(j),index);
                }
            }
            index = index.substring(0,index.length()-1);

            YearCollaboratorsIndexMap.put(cooperateryear.get(j),index);
        }
        for(int i = 0;i < cooperateryear.size();i++) {
            for (String year : YearCollaboratorsIndexMap.keySet()) {
                if(year.equals(cooperateryear.get(i))) {
                    YearcooperId id = new YearcooperId();
                    id.setYear(year);
                    id.setCoId(YearCollaboratorsIndexMap.get(year));
                    YearCollaboratorsIndex.add(id);
                }
            }
        }

        return YearCollaboratorsIndex;
    }
}

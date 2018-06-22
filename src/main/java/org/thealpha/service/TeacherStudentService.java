package org.thealpha.service;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.dao.inter.TeacherStudentDao;
import org.thealpha.model.Cooperater;
import org.thealpha.model.FirstCoYear;
import org.thealpha.model.Scholar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 18-1-17.
 */
@Service
public class TeacherStudentService {

    @Autowired
    private TeacherStudentDao teacherStudentDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    @Autowired
    private ScholarCooperateDao scholarCooperateDao;

    public List<Scholar> getStudentsByTeacherId(String teacherId) {
        List<String> studentIds = teacherStudentDao.getStudentsByTeacherId(teacherId);
        if (CollectionUtils.isNotEmpty(studentIds)) {
            return scholarInfoDao.getScholarsByIds(studentIds);
        }
        return null;
    }

    public Scholar getTeacherByStudentId(String studentId) {
        String teacherId = teacherStudentDao.getTeacherByStudentId(studentId);
        if (StringUtils.isNotBlank(teacherId)) {
            return scholarInfoDao.getScholarById(teacherId);
        }
        return null;
    }
    public List<FirstCoYear> getFirstCooperateYearById(String scholarId) {
        List<FirstCoYear> firstCoList = scholarCooperateDao.getFirstCooperateYearById(scholarId);
       /* for (FirstCoYear firstCoYear: firstCoList) {
            String cooperate = firstCoYear.getCooperate();
            int year = firstCoYear.getYear();
        }*/


        return firstCoList;
    }
    public List<Cooperater> getCooperaterById(String scholarId) {
        List<Cooperater> cooperaterList = teacherStudentDao.getCooperatersById(scholarId);
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
        return cooperaterList;
    }
}

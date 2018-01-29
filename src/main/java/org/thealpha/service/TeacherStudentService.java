package org.thealpha.service;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.dao.inter.TeacherStudentDao;
import org.thealpha.model.Scholar;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-17.
 */
@Service
public class TeacherStudentService {

    @Autowired
    private TeacherStudentDao teacherStudentDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

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

}

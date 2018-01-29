package org.thealpha.dao.inter;

import org.thealpha.model.Scholar;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-17.
 */
public interface TeacherStudentDao {
    List<String> getStudentsByTeacherId(String teacherId);
    String getTeacherByStudentId(String studentId);
}

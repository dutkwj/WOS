package org.thealpha.dao.imple;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.TeacherStudentDao;
import org.thealpha.model.Cooperater;
import org.thealpha.model.Scholar;
import org.thealpha.util.ConfigurationConstant;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kangwenjie on 18-1-17.
 */
@Repository
public class TeacherStudentDaoImpl implements TeacherStudentDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

    public List<String> getStudentsByTeacherId(String teacherId) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, teacherId, ConfigurationConstant.CF_TEACHER_STUDENT, ConfigurationConstant.QF_STUDENTS, new RowMapper<List<String>>() {
            public List<String> mapRow(Result result, int rowNum) throws Exception {
                String studentIds = Bytes.toString(result.value());
                if (StringUtils.isNotBlank(studentIds)) {
                    List<String> studentIdList = new ArrayList<String>();
                    for (String studentId : studentIds.split(", ")) {
                        studentIdList.add(studentId);
                    }
                    return studentIdList;
                }
                return null;
            }
        });
    }

    public String getTeacherByStudentId(String studentId) {
        return hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, studentId, ConfigurationConstant.CF_TEACHER_STUDENT, ConfigurationConstant.QF_TEACHER, new RowMapper<String>() {
            public String mapRow(Result result, int rowNum) throws Exception {
                String teacherId = Bytes.toString(result.value());
                if (StringUtils.isNotBlank(teacherId)) {
                    return teacherId;
                }
                return null;
            }
        });
    }
    public List<Cooperater> getCooperatersById(String id) {
        List<Cooperater> result = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, id, new RowMapper<List<Cooperater>>() {
            public List<Cooperater> mapRow(Result result, int i) throws Exception {
                List<Cooperater> cooperaterList = new ArrayList<Cooperater>();
                String cooperate = Bytes.toString(result.getValue(ConfigurationConstant.CF_COOPERATE.getBytes(), ConfigurationConstant.QF_COUNT.getBytes()));
                if (cooperate != null && !"".equals(cooperate)) {
                    String[] cooperates = cooperate.split(", ");
                    for (String co : cooperates) {
                        Cooperater cooperater = new Cooperater();
                        cooperater.setIndex(co.substring(0, co.indexOf(":")));
                        cooperater.setCount(Integer.parseInt(co.substring(co.indexOf(":") + 1, co.length())));
                        cooperaterList.add(cooperater);
                    }
                }
                return  cooperaterList;
            }
        });
        return result;
    }
}

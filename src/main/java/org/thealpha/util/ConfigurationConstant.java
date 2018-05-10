package org.thealpha.util;

/**
 * Created by kangwenjie on 17-12-14.
 */
public class ConfigurationConstant {
//    cs_scholar, personal_info:(name, aff, lat_lng, h_index, field_name, cooperate_number, co_team_number, students_number, ref_number, refed_number, co_ref_number, co_refed_number), papers:(paper_ids)
    public static final String TABLE_CS_SCHOLAR = "cs_scholar";
    public static final String CF_PERSONAL_INFO = "personal_info";
    public static final String CF_PAPERS = "papers";
    public static final String QF_NAME = "name";
    public static final String QF_AFF = "aff";
    public static final String QF_PAPER_IDS = "paper_ids";
    public static final String QF_LAT_LNG = "lat_lng";
    public static final String QF_H_INDEX = "h_index";
    public static final String QF_Q_INDEX = "q_index";
    public static final String QF_FIELD_NAME = "field_name";
    public static final String QF_COOPERATE_NUMBER = "cooperate_number";
    public static final String QF_CO_TEAM_NUMBER = "co_team_number";
    public static final String QF_STUDENTS_NUMBER = "students_number";
    public static final String QF_REF_NUMBER = "ref_number";
    public static final String QF_REFED_NUMBER = "refed_number";
    public static final String QF_CO_REF_NUMBER = "co_ref_number";
    public static final String QF_CO_REFED_NUMBER = "co_refed_number";



    //    cs_relationship, cooperate:(count, eve_year_count), co_team:(team_intension), teacher_student:(teacher, students)
    public static final String TABLE_CS_RELATIONSHIP = "cs_relationship";
    public static final String CF_COOPERATE = "cooperate";
    public static final String CF_CO_TEAM = "co_team";
    public static final String CF_TEACHER_STUDENT = "teacher_student";
    public static final String CF_REFERENCE = "reference";
    public static final String QF_COUNT = "count";
    public static final String QF_EVE_YEAR_COUNT = "eve_year_count";
    public static final String QF_MVCS = "mvcs";
    public static final String QF_TEAM_INTENSION = "team_intension";
    public static final String QF_TEACHER = "tacher";
    public static final String QF_STUDENTS = "students";


    //    cs_paper, authors:(author_ids), reference:(ref_ids, refed_ids, co_ref_ids, co_refed_ids)
    public static final String TABLE_CS_PAPER = "cs_paper";
    public static final String CF_AUTHORS = "authors";
    public static final String QF_AUTHOR_IDS = "author_ids";
    public static final String QF_REF_IDS = "ref_ids";
    public static final String QF_REFED_IDS = "refed_ids";
    public static final String QF_CO_REF_IDS = "co_ref_ids";
    public static final String QF_CO_REFED_IDS = "co_refed_ids";

    public static final String TABLE_CS_USER = "cs_user";
    public static final String CF_USER_INFO = "user_info";
    public static final String CF_SCAN_RECORD = "scan_record";
    public static final String QF_INDEX = "index";
    public static final String QF_PASSWORD = "password";
    public static final String QF_SEX = "sex";
    public static final String QF_POSITION = "position";
    public static final String QF_ORG = "org";
    public static final String QF_NATION = "nation";
    public static final String QF_BORN_DATE = "born_date";
    public static final String QF_SUPERVISOR_NAME = "supervisor_name";
    public static final String QF_GRAD_DATE = "grad_date";
    public static final String QF_GRAD_college = "grad_college";
    public static final String QF_DEGREE = "degree";
    public static final String QF_PERSONAL_PHOTO_NAME = "personal_photo_name";
    public static final String QF_RESEARCH_FIELD = "research_field";
    public static final String QF_WEIGHT = "weight";


    public static final String ZK_QUORUM = "10.1.0.188,10.1.0.187,10.1.16.122";
    public static final String ZK_CLIENT_PORT = "2181";

    public static final String REDIS_ALL_SCHOLARS = "redis_all_scholars";
    public static final String REDIS_HINDEX_TOP10_SCHOLARS = "redis_hindex_top10_scholars";
    public static final String REDIS_HINDEX_TOP100_SCHOLARS = "redis_hindex_top100_scholars";


    public static final String REDIS_COOPERATE_NUMBER_TOP100_SCHOLARS = "redis_cooperate_number_top100_scholars";
    public static final String REDIS_CO_TEAM_NUMBER_TOP100_SCHOLARS = "redis_co_team_number_top100_scholars";
    public static final String REDIS_STUDENTS_NUMBER_TOP100_SCHOLARS = "redis_students_number_top100_scholars";
    public static final String REDIS_REF_NUMBER_TOP100_SCHOLARS = "redis_ref_number_top100_scholars";
    public static final String REDIS_REFED_NUMBER_TOP100_SCHOLARS = "redis_refed_number_top100_scholars";
    public static final String REDIS_CO_REF_NUMBER_TOP100_SCHOLARS = "redis_co_ref_number_top100_scholars";
    public static final String REDIS_CO_REFED_NUMBER_TOP100_SCHOLARS = "redis_co_refed_number_top100_scholars";

    public static final String REDIS_HINDEX_0_50W = "redis_hindex_0_50w";
    public static final String REDIS_HINDEX_50_100W = "redis_hindex_50_100w";
    public static final String REDIS_HINDEX_100_150W = "redis_hindex_100_150w";
    public static final String REDIS_HINDEX_150_200W = "redis_hindex_150_200w";
    public static final String REDIS_QINDEX_0_50W = "redis_qindex_0_50w";
    public static final String REDIS_QINDEX_50_100W = "redis_qindex_50_100w";
    public static final String REDIS_QINDEX_100_150W = "redis_qindex_100_150w";
    public static final String REDIS_QINDEX_150_200W = "redis_qindex_150_200w";

    public static final String REDIS_AUTHORID_HINDEX_0_50W = "redis_authorid_hindex_0_50w";
    public static final String REDIS_AUTHORID_HINDEX_50_100W = "redis_authorid_hindex_50_100w";
    public static final String REDIS_AUTHORID_HINDEX_100_150W = "redis_authorid_hindex_100_150w";
    public static final String REDIS_AUTHORID_HINDEX_150_200W = "redis_authorid_hindex_150_200w";
    public static final String REDIS_AUTHORID_QINDEX_0_50W = "redis_authorid_qindex_0_50w";
    public static final String REDIS_AUTHORID_QINDEX_50_100W = "redis_authorid_qindex_50_100w";
    public static final String REDIS_AUTHORID_QINDEX_100_150W = "redis_authorid_qindex_100_150w";
    public static final String REDIS_AUTHORID_QINDEX_150_200W = "redis_authorid_qindex_150_200w";


    public static final int MAX_SIZE = 200;
}

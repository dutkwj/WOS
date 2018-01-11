package org.thealpha.util;

/**
 * Created by kangwenjie on 17-12-14.
 */
public class ConfigurationConstant {
//    cs_scholar, personal_info:(name, aff, lat_lng), papers:(paper_ids)
    public static final String TABLE_CS_SCHOLAR = "cs_scholar";
    public static final String CF_PERSONAL_INFO = "personal_info";
    public static final String CF_PAPERS = "papers";
    public static final String QF_NAME = "name";
    public static final String QF_AFF = "aff";
    public static final String QF_PAPER_IDS = "paper_ids";
    public static final String QF_LAT_LNG = "lat_lng";


//    cs_relationship, cooperate:(count, eve_year_count), co_team:(team_intension), teacher_student:()
    public static final String TABLE_CS_RELATIONSHIP = "cs_relationship";
    public static final String CF_COOPERATE = "cooperate";
    public static final String CF_CO_TEAM = "co_team";
    public static final String CF_TEACHER_STUDENT = "teacher_student";
    public static final String CF_REFERENCE = "reference";
    public static final String QF_COUNT = "count";
    public static final String QF_EVE_YEAR_COUNT = "eve_year_count";
    public static final String QF_TEAM_INTENSION = "team_intension";


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
    public static final String QF_EMAIL = "email";
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


    public static final String ZK_QUORUM = "100.66.1.209,100.66.2.1,100.66.2.22";
    public static final String ZK_CLIENT_PORT = "2181";


}

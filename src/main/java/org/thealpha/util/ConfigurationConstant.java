package org.thealpha.util;

/**
 * Created by kangwenjie on 17-12-14.
 */
public class ConfigurationConstant {
//    cs_scholar, personal_info:(name, aff, lat_lng, h_index, q_index, field_name, cooperate_number, co_team_number, students_number, ref_number, refed_number, co_ref_number, co_refed_number), papers:(paper_ids, paper_number)
    public static final String TABLE_CS_SCHOLAR = "cs_scholar";
    public static final String CF_PERSONAL_INFO = "personal_info";
    public static final String CF_PAPERS = "papers";
    public static final String QF_NAME = "name";
    public static final String QF_AFF = "aff";//机构
    public static final String QF_PAPER_IDS = "paper_ids";
    public static final String QF_PAPER_YEAR = "paper_year";
    public static final String QF_PAPER_YEAR_NUMBER = "paper_year_number";
    public static final String QF_LAT_LNG = "lat_lng";//经纬度
    public static final String QF_H_INDEX = "h_index";//每篇论文至少被引了h次的h篇文章
    public static final String QF_Q_INDEX = "q_index";//
    public static final String QF_FIELD_NAME = "field_name";
    public static final String QF_PAPER_NUMBER = "paper_number";
    public static final String QF_COOPERATE_NUMBER = "cooperate_number";
    public static final String QF_CO_TEAM_NUMBER = "co_team_number";
    public static final String QF_STUDENTS_NUMBER = "students_number";
    public static final String QF_REF_NUMBER = "ref_number";
    public static final String QF_REFED_NUMBER = "refed_number";
    public static final String QF_CO_REF_NUMBER = "co_ref_number";
    public static final String QF_CO_REFED_NUMBER = "co_refed_number";


    //    cs_relationship, cooperate:(count, collaboration_intensity, eve_year_count, every_year_collaborators, every_year_conumber, every_year_papernumber), co_team:(team_intension), teacher_student:(teacher, students, student_number_year), citation:(cite_number, cited_number, co_cite_number,
        // co_cited_number)
    public static final String TABLE_CS_RELATIONSHIP = "cs_relationship";
    public static final String CF_COOPERATE = "cooperate";
    public static final String CF_CO_TEAM = "co_team";
    public static final String CF_TEACHER_STUDENT = "teacher_student";
    public static final String CF_REFERENCE = "reference";
    public static final String CF_CITATION = "citation";
    public static final String QF_COUNT = "count";
    public static final String QF_COLLABORATION_INTENSITY = "collaboration_intensity";
    public static final String QF_EVERY_YEAR_COLLABORATORS = "every_year_collaborators";
    public static final String QF_EVERY_YEAR_CONUMBER = "every_year_conumber";
    public static final String QF_EVERY_YEAR_PAPERNUMBER = "every_year_papernumber";
    public static final String QF_EVE_YEAR_COUNT = "eve_year_count";
    public static final String QF_FIRST_COOPERATE_YEAR = "first_cooperate_year";
    public static final String QF_MVCS = "mvcs";
    public static final String QF_TEAM_INTENSION = "team_intension";
    public static final String QF_TEACHER = "tacher";
    public static final String QF_STUDENTS = "students";
    public static final String QF_CITE_NUMBER = "cite_number";
    public static final String QF_CITED_NUMBER = "cited_number";
    public static final String QF_STUDENT_NUMBER_YEAR = "student_number_year";
    public static final String QF_CO_CITE_NUMBER ="co_cite_number";
    public static final String QF_CO_CITED_NUMBER ="co_cited_number";

    //    cs_paper, authors:(author_ids), reference:(ref_ids, every_year_ref_ids, refed_ids, every_year_refed_ids, co_ref_ids, co_refed_ids)
    public static final String TABLE_CS_PAPER = "cs_paper";
    public static final String CF_AUTHORS = "authors";
    //    paper表也有reference这个列族
//    public static final String CF_REFERENCE = "reference";
    public static final String QF_AUTHOR_IDS = "author_ids";
    public static final String QF_REF_IDS = "ref_ids";
    public static final String QF_EVERY_YEAR_REF_IDS = "every_year_ref_ids";
    public static final String QF_EVERY_YEAR_REFED_IDS = "every_year_refed_ids";
    public static final String QF_CO_REF_PAPERS_DETAIL = "co_ref_papers_detail";
    public static final String QF_CO_REFED_PAPERS_DETAIL = "co_refed_papers_detail";
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


    public static final String ZK_QUORUM = "10.1.0.188,10.1.27.119,10.1.37.157";
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
    public static final String REDIS_POTENTIAL_INEDX_3YEARS_TOP100_SCHOLARS = "redis_potential_index_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_INEDX_5YEARS_TOP100_SCHOLARS = "redis_potential_index_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_INEDX_10YEARS_TOP100_SCHOLARS = "redis_potential_index_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_GROWTH_3YEARS_TOP100_SCHOLARS = "redis_potential_growth_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_GROWTH_5YEARS_TOP100_SCHOLARS = "redis_potential_growth_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_GROWTH_10YEARS_TOP100_SCHOLARS = "redis_potential_growth_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_1_5_3YEARS_TOP100_SCHOLARS =
            "redis_potential_aca_1_5_3years_top100_scholars";//
    public static final String REDIS_POTENTIAL_ACA_6_15_3YEARS_TOP100_SCHOLARS = "redis_potential_aca_6_15_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_16_25_3YEARS_TOP100_SCHOLARS = "redis_potential_aca_16_25_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_26_40_3YEARS_TOP100_SCHOLARS = "redis_potential_aca_26_40_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_41_60_3YEARS_TOP100_SCHOLARS = "redis_potential_aca_41_60_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_61_80_3YEARS_TOP100_SCHOLARS = "redis_potential_aca_61_80_3years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_1_5_5YEARS_TOP100_SCHOLARS = "redis_potential_aca_1_5_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_6_15_5YEARS_TOP100_SCHOLARS = "redis_potential_aca_6_15_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_16_25_5YEARS_TOP100_SCHOLARS = "redis_potential_aca_16_25_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_26_40_5YEARS_TOP100_SCHOLARS = "redis_potential_aca_26_40_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_41_60_5YEARS_TOP100_SCHOLARS = "redis_potential_aca_41_60_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_61_80_5YEARS_TOP100_SCHOLARS = "redis_potential_aca_61_80_5years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_1_5_10YEARS_TOP100_SCHOLARS = "redis_potential_aca_1_5_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_6_15_10YEARS_TOP100_SCHOLARS = "redis_potential_aca_6_15_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_16_25_10YEARS_TOP100_SCHOLARS = "redis_potential_aca_16_25_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_26_40_10YEARS_TOP100_SCHOLARS = "redis_potential_aca_26_40_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_41_60_10YEARS_TOP100_SCHOLARS = "redis_potential_aca_41_60_10years_top100_scholars";
    public static final String REDIS_POTENTIAL_ACA_61_80_10YEARS_TOP100_SCHOLARS = "redis_potential_aca_61_80_10years_top100_scholars";

    public static final String REDIS_COOPERATE_NUMBER_BOTTOM100_SCHOLARS = "redis_cooperate_number_bottom100_scholars";
    public static final String REDIS_CO_TEAM_NUMBER_BOTTOM100_SCHOLARS = "redis_co_team_number_bottom100_scholars";
    public static final String REDIS_STUDENTS_NUMBER_BOTTOM100_SCHOLARS = "redis_students_number_bottom100_scholars";
    public static final String REDIS_REF_NUMBER_BOTTOM100_SCHOLARS = "redis_ref_number_bottom100_scholars";
    public static final String REDIS_REFED_NUMBER_BOTTOM100_SCHOLARS = "redis_refed_number_bottom100_scholars";
    public static final String REDIS_CO_REF_NUMBER_BOTTOM100_SCHOLARS = "redis_co_ref_number_bottom100_scholars";
    public static final String REDIS_CO_REFED_NUMBER_BOTTOM100_SCHOLARS = "redis_co_refed_number_bottom100_scholars";
    public static final String REDIS_POTENTIAL_INEDX_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_index_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_INEDX_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_index_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_INEDX_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_index_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_GROWTH_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_growth_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_GROWTH_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_growth_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_GROWTH_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_growth_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_1_5_3YEARS_BOTTOM100_SCHOLARS =
            "redis_potential_aca_1_5_3years_bottom100_scholars";//
    public static final String REDIS_POTENTIAL_ACA_6_15_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_6_15_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_16_25_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_16_25_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_26_40_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_26_40_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_41_60_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_41_60_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_61_80_3YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_61_80_3years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_1_5_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_1_5_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_6_15_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_6_15_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_16_25_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_16_25_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_26_40_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_26_40_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_41_60_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_41_60_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_61_80_5YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_61_80_5years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_1_5_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_1_5_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_6_15_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_6_15_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_16_25_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_16_25_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_26_40_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_26_40_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_41_60_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_41_60_10years_bottom100_scholars";
    public static final String REDIS_POTENTIAL_ACA_61_80_10YEARS_BOTTOM100_SCHOLARS = "redis_potential_aca_61_80_10years_bottom100_scholars";

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

    public static final String REDIS_AUTHORID_MVC_GRAPH = "redis_authorid_mvc_graph";
    public static final String REDIS_AUTHORID_TEAM_GRAPH = "redis_authorid_team_graph";

    public static final int MAX_SIZE = 200;
}

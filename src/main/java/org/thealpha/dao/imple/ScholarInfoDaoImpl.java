package org.thealpha.dao.imple;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.filter.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;
import org.thealpha.model.SearchItem;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.HbaseUtils;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.JedisCluster;

import java.io.IOException;
import java.util.*;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Repository
public class ScholarInfoDaoImpl implements ScholarInfoDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

    @Autowired
    private JedisCluster jedisCluster;

    public List<String> getRecommendScholars() {
        List<String> recommendScholars = new ArrayList<String>();
//        hbaseTemplate.find(ConfigurationConstant.TABLE_CS_SCHOLAR, new Scan(), new RowMapper<Scholar>() {
//            public Scholar mapRow(Result result, int rowNum) throws Exception {
//                return null;
//            }
//        })
        recommendScholars.add("0DE9F497");
        recommendScholars.add("80E2C811");
        recommendScholars.add("7FC8CD3A");
        recommendScholars.add("80E2C818");
        recommendScholars.add("843C4E16");
        recommendScholars.add("0E5CA302");
        recommendScholars.add("7998D4BA");
        recommendScholars.add("7F27AE02");
        recommendScholars.add("85E123FB");
        recommendScholars.add("77AFDBB5");
        recommendScholars.add("84971266");
        recommendScholars.add("86108C8B");

        return recommendScholars;
    }

    public List<String> getMoreRecommendScholars() {
        List<String> moreRecommendScholars = new ArrayList<String>();
        moreRecommendScholars.add("76656227");
        moreRecommendScholars.add("0DE9F497");
        moreRecommendScholars.add("80E2C811");
        moreRecommendScholars.add("7FC8CD3A");
        moreRecommendScholars.add("80E2C818");
        moreRecommendScholars.add("843C4E16");
        moreRecommendScholars.add("0E5CA302");
        moreRecommendScholars.add("7998D4BA");
        moreRecommendScholars.add("7F27AE02");
        moreRecommendScholars.add("85E123FB");
        moreRecommendScholars.add("77AFDBB5");
        moreRecommendScholars.add("72D45581");
        moreRecommendScholars.add("7FE3C782");
        moreRecommendScholars.add("7F28E352");
        moreRecommendScholars.add("7555D6F7");
        moreRecommendScholars.add("6661B38F");

        return moreRecommendScholars;
    }

    public List<Scholar> getScholarsByIds(List<String> scholarIds) {
        if (CollectionUtils.isEmpty(scholarIds)) {
            return null;
        }
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        Connection connection = null;
        Table table = null;
        Result[] results = null;

        List<Get> gets = new ArrayList<Get>();
        for (String id : scholarIds) {
            Get get = new Get(Bytes.toBytes(id));
            get.addFamily(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO));
            gets.add(get);

        }
        List<Scholar> scholarList = new ArrayList<Scholar>();
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            results = table.get(gets);
            for (Result result : results) {
                Scholar scholar = new Scholar();
                for (Cell cell : result.rawCells()) {
                    String rowKey = new String(CellUtil.cloneRow(cell));

                    String qualiFier = new String(CellUtil.cloneQualifier(cell));
                    String value = new String(CellUtil.cloneValue(cell));
                    scholar.setIndex(rowKey);
                    if (ConfigurationConstant.QF_NAME.equals(qualiFier)) {
                        scholar.setName(value);
                    } else if (ConfigurationConstant.QF_AFF.equals(qualiFier)) {
                        value = value.replaceAll("\u2028", " ");
                        scholar.setAff(value);
                    } else if (ConfigurationConstant.QF_LAT_LNG.equals(qualiFier)) {
                        scholar.setLatlng(value);
                        scholar.setLatitude(value.split(", ")[0]);
                        scholar.setLongitude(value.split(", ")[1]);
                    } else if (ConfigurationConstant.QF_H_INDEX.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setHindex(Double.parseDouble(value));
                        }
                    } else if (ConfigurationConstant.QF_Q_INDEX.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setQindex(Double.parseDouble(value));
                        }
                    } else if (ConfigurationConstant.QF_FIELD_NAME.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setFieldName(value);
                        }
                    } else if (ConfigurationConstant.QF_COOPERATE_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setCooperateNumber(Integer.parseInt(value));
                        }
                    } else if (ConfigurationConstant.QF_CO_TEAM_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setCoTeamNumber(Integer.parseInt(value));
                        }
                    } else if (ConfigurationConstant.QF_STUDENTS_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setStudentsNumber(Integer.parseInt(value));
                        }
                    } else if (ConfigurationConstant.QF_REF_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setRefNumber(Integer.parseInt(value));
                        }
                    } else if (ConfigurationConstant.QF_REFED_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setRefedNumber(Integer.parseInt(value));
                        }
                    } else if (ConfigurationConstant.QF_CO_REF_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setCoRefNumber(Integer.parseInt(value));
                        }
                    } else if (ConfigurationConstant.QF_CO_REFED_NUMBER.equals(qualiFier)) {
                        if (StringUtils.isNotBlank(value)) {
                            scholar.setCoRefedNumber(Integer.parseInt(value));
                        }
                    }
                }
                scholarList.add(scholar);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                table.close();
                connection.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return scholarList;
    }

    public Scholar getScholarById(final String scholarId) {
        Scholar result = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_SCHOLAR, scholarId, new RowMapper<Scholar>() {
            public Scholar mapRow(Result result, int rowNum) throws Exception {
                Scholar scholar = new Scholar();
                String name = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME)));
                String aff = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF)));
                String latlng = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_LAT_LNG)));
                String hindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_H_INDEX)));
                String qindex = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_Q_INDEX)));
                String fieldName = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_FIELD_NAME)));
                String cooperatorNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_COOPERATE_NUMBER)));
                String coTeamNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_CO_TEAM_NUMBER)));
                String studentsNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_STUDENTS_NUMBER)));
                String refNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_REF_NUMBER)));
                String refedNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_REFED_NUMBER)));
                String coRefNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_CO_REF_NUMBER)));
                String coRefedNumber = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_CO_REFED_NUMBER)));

                scholar.setIndex(scholarId);
                scholar.setName(name);
                scholar.setAff(aff);
                if (StringUtils.isNotBlank(latlng)) {
                    scholar.setLatlng(latlng);
                    scholar.setLatitude(latlng.split(", ")[0]);
                    scholar.setLongitude(latlng.split(", ")[1]);
                }
                if (StringUtils.isNotBlank(hindex)) {
                    scholar.setHindex(Double.parseDouble(hindex));
                }
                if (StringUtils.isNotBlank(qindex)) {
                    scholar.setQindex(Double.parseDouble(qindex));
                }
                if (StringUtils.isNotBlank(fieldName)) {
                    scholar.setFieldName(fieldName);
                }
                if (StringUtils.isNotBlank(cooperatorNumber)) {
                    scholar.setCooperateNumber(Integer.parseInt(cooperatorNumber));
                }
                if (StringUtils.isNotBlank(coTeamNumber)) {
                    scholar.setCoTeamNumber(Integer.parseInt(coTeamNumber));
                }
                if (StringUtils.isNotBlank(studentsNumber)) {
                    scholar.setStudentsNumber(Integer.parseInt(studentsNumber));
                }
                if (StringUtils.isNotBlank(refNumber)) {
                    scholar.setRefNumber(Integer.parseInt(refNumber));
                }
                if (StringUtils.isNotBlank(refedNumber)) {
                    scholar.setRefedNumber(Integer.parseInt(refedNumber));
                }
                if (StringUtils.isNotBlank(coRefNumber)) {
                    scholar.setCoRefNumber(Integer.parseInt(coRefNumber));
                }
                if (StringUtils.isNotBlank(coRefedNumber)) {
                    scholar.setCoRefedNumber(Integer.parseInt(coRefedNumber));
                }
                return scholar;
            }
        });
        return result;
    }

    public List<String> getScholarIdsBySearchItem(SearchItem searchItem) throws IOException {
        Connection connection = HbaseUtils.getConnection();
        Table table = HbaseUtils.getTable(ConfigurationConstant.TABLE_CS_SCHOLAR, connection);
        Scan scan = new Scan();
        List<String> scholarNameIndex = null;
        if (StringUtils.isNotBlank(searchItem.getScholarName())) {
            scholarNameIndex = new ArrayList<String>();
            scan.setFilter(new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator(searchItem.getScholarName())));
            scan.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME));
            ResultScanner resultScanner = table.getScanner(scan);
            for (Result result : resultScanner) {
                scholarNameIndex.add(Bytes.toString(result.getRow()));
            }
        }
        List<String> scholarAffIndex = null;
        if (StringUtils.isNotBlank(searchItem.getAffName())) {
            scholarAffIndex = new ArrayList<String>();
            scan.setFilter(new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator(searchItem.getAffName())));
            scan.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF));
            ResultScanner resultScanner = table.getScanner(scan);
            for (Result result : resultScanner) {
                scholarAffIndex.add(Bytes.toString(result.getRow()));
            }
        }
        List<String> scholarQindex = null;
        if (StringUtils.isNotBlank(searchItem.getQindex())) {
            scholarQindex = new ArrayList<String>();
            String qindex = searchItem.getQindex();
            double lowQindex = Double.parseDouble(qindex.split(", ")[0]);
            double highQindex = Double.parseDouble(qindex.split(", ")[1]);
            boolean over = false;
            List<String> authorIdList = null;
            for (int i = 0; i < 50; i++) {
                authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_QINDEX_0_50W, i * 10000, (i + 1) * 10000);
                String firstAuthorId = authorIdList.get(0);
                String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                double firstQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_0_50W, firstAuthorId).get(0));
                double lastQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_0_50W, lastAuthorId).get(0));
                if (firstQindex < lowQindex) {
                    over = true;
                    break;
                }
                if (lastQindex > highQindex) {
                    continue;
                }
                for (String authorId : authorIdList) {
                    double sQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_0_50W, authorId).get(0));
                    if (lowQindex > sQindex) {
                        over = true;
                        break;
                    }
                    if (highQindex < sQindex) {
                        continue;
                    }
                    scholarQindex.add(authorId);
                }
            }

            if (!over) {
                for (int i = 0; i < 50; i++) {
                    authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_QINDEX_50_100W, i * 10000, (i + 1) * 10000);
                    String firstAuthorId = authorIdList.get(0);
                    String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                    double firstQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_50_100W, firstAuthorId).get(0));
                    double lastQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_50_100W, lastAuthorId).get(0));
                    if (firstQindex < lowQindex) {
                        over = true;
                        break;
                    }
                    if (lastQindex > highQindex) {
                        continue;
                    }
                    for (String authorId : authorIdList) {
                        double sQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_50_100W, authorId).get(0));
                        if (lowQindex > sQindex) {
                            over = true;
                            break;
                        }
                        if (highQindex < sQindex) {
                            continue;
                        }
                        scholarQindex.add(authorId);
                    }
                }
            }
            if (!over) {
                for (int i = 0; i < 50; i++) {
                    authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_QINDEX_100_150W, i * 10000, (i + 1) * 10000);
                    String firstAuthorId = authorIdList.get(0);
                    String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                    double firstQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_100_150W, firstAuthorId).get(0));
                    double lastQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_100_150W, lastAuthorId).get(0));
                    if (firstQindex < lowQindex) {
                        over = true;
                        break;
                    }
                    if (lastQindex > highQindex) {
                        continue;
                    }
                    for (String authorId : authorIdList) {
                        double sQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_100_150W, authorId).get(0));
                        if (lowQindex > sQindex) {
                            over = true;
                            break;
                        }
                        if (highQindex < sQindex) {
                            continue;
                        }
                        scholarQindex.add(authorId);
                    }
                }
            }
            if (!over) {
                for (int i = 0; i < 50; i++) {
                    authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_QINDEX_150_200W, i * 10000, (i + 1) * 10000);
                    if (CollectionUtils.isEmpty(authorIdList)) {
                        break;
                    }
                    String firstAuthorId = authorIdList.get(0);
                    String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                    double firstQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_150_200W, firstAuthorId).get(0));
                    double lastQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_150_200W, lastAuthorId).get(0));
                    if (firstQindex < lowQindex) {
                        break;
                    }
                    if (lastQindex > highQindex) {
                        continue;
                    }
                    for (String authorId : authorIdList) {
                        double sQindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_QINDEX_150_200W, authorId).get(0));
                        if (lowQindex > sQindex) {
                            break;
                        }
                        if (highQindex < sQindex) {
                            continue;
                        }
                        scholarQindex.add(authorId);
                    }
                }
            }
        }

        List<String> scholarHindex = null;
        if (StringUtils.isNotBlank(searchItem.getHindex())) {
            scholarHindex = new ArrayList<String>();
            String hindex = searchItem.getHindex();
            double lowHindex = Double.parseDouble(hindex.split(", ")[0]);
            double highHindex = Double.parseDouble(hindex.split(", ")[1]);
            boolean over = false;
            List<String> authorIdList = null;
            for (int i = 0; i < 50; i++) {
                authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_HINDEX_0_50W, i * 10000, (i + 1) * 10000);
                String firstAuthorId = authorIdList.get(0);
                String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                double firstHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_0_50W, firstAuthorId).get(0));
                double lastHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_0_50W, lastAuthorId).get(0));
                if (firstHindex < lowHindex) {
                    over = true;
                    break;
                }
                if (lastHindex > highHindex) {
                    continue;
                }
                for (String authorId : authorIdList) {
                    double sHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_0_50W, authorId).get(0));
                    if (lowHindex > sHindex) {
                        over = true;
                        break;
                    }
                    if (highHindex < sHindex) {
                        continue;
                    }
                    scholarHindex.add(authorId);
                }
            }

            if (!over) {
                for (int i = 0; i < 50; i++) {
                    authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_HINDEX_50_100W, i * 10000, (i + 1) * 10000);
                    String firstAuthorId = authorIdList.get(0);
                    String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                    double firstHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_50_100W, firstAuthorId).get(0));
                    double lastHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_50_100W, lastAuthorId).get(0));
                    if (firstHindex < lowHindex) {
                        over = true;
                        break;
                    }
                    if (lastHindex > highHindex) {
                        continue;
                    }
                    for (String authorId : authorIdList) {
                        double sHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_50_100W, authorId).get(0));
                        if (lowHindex > sHindex) {
                            over = true;
                            break;
                        }
                        if (highHindex < sHindex) {
                            continue;
                        }
                        scholarHindex.add(authorId);
                    }
                }
            }
            if (!over) {
                for (int i = 0; i < 50; i++) {
                    authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_HINDEX_100_150W, i * 10000, (i + 1) * 10000);
                    String firstAuthorId = authorIdList.get(0);
                    String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                    double firstHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_100_150W, firstAuthorId).get(0));
                    double lastHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_100_150W, lastAuthorId).get(0));
                    if (firstHindex < lowHindex) {
                        over = true;
                        break;
                    }
                    if (lastHindex > highHindex) {
                        continue;
                    }
                    for (String authorId : authorIdList) {
                        double sHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_100_150W, authorId).get(0));
                        if (lowHindex > sHindex) {
                            over = true;
                            break;
                        }
                        if (highHindex < sHindex) {
                            continue;
                        }
                        scholarHindex.add(authorId);
                    }
                }
            }
            if (!over) {
                for (int i = 0; i < 50; i++) {
                    authorIdList = jedisCluster.lrange(ConfigurationConstant.REDIS_HINDEX_150_200W, i * 10000, (i + 1) * 10000);
                    if (CollectionUtils.isEmpty(authorIdList)) {
                        break;
                    }
                    String firstAuthorId = authorIdList.get(0);
                    String lastAuthorId = authorIdList.get(authorIdList.size() - 1);
                    double firstHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_150_200W, firstAuthorId).get(0));
                    double lastHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_150_200W, lastAuthorId).get(0));
                    if (firstHindex < lowHindex) {
                        break;
                    }
                    if (lastHindex > highHindex) {
                        continue;
                    }
                    for (String authorId : authorIdList) {
                        double sHindex = Double.parseDouble(jedisCluster.hmget(ConfigurationConstant.REDIS_AUTHORID_HINDEX_150_200W, authorId).get(0));
                        if (lowHindex > sHindex) {
                            break;
                        }
                        if (highHindex < sHindex) {
                            continue;
                        }
                        scholarHindex.add(authorId);
                    }
                }
            }
        }

//        Set<String> scholarHindex = null;
//        if (StringUtils.isNotBlank(searchItem.getHindex())) {
//            scholarHindex= new HashSet<String>();
//            String[] hindexs = searchItem.getHindex().split("-");
//            double lowHindex = Double.parseDouble(hindexs[0]);
//            double highHindex = Double.parseDouble(hindexs[1]);
//            byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_ALL_SCHOLARS.getBytes());
//            List<Scholar> allScholars = (List<Scholar>) ListTranscoder.deserialize(in);
//            for (Scholar scholar : allScholars) {
//                double hindex = scholar.getHindex();
//                if (hindex >= highHindex) {
//                    continue;
//                } else if (hindex < highHindex && hindex >= lowHindex) {
//                    scholarHindex.add(scholar.getIndex());
//                } else {
//                    break;
//                }
//            }
//        }

        HbaseUtils.closeTableAndConn(table, connection);

        List<String> scholarIds = null;
        if (CollectionUtils.isNotEmpty(scholarNameIndex)) {
            if (CollectionUtils.isEmpty(scholarIds)) {
                scholarIds = scholarNameIndex;
            } else {
                scholarIds = (List<String>) CollectionUtils.intersection(scholarIds, scholarNameIndex);
            }
        }
        if (CollectionUtils.isNotEmpty(scholarAffIndex)) {
            if (CollectionUtils.isEmpty(scholarIds)) {
                scholarIds = scholarAffIndex;
            } else {
                scholarIds = (List<String>) CollectionUtils.intersection(scholarIds, scholarAffIndex);
            }
        }
        if (CollectionUtils.isNotEmpty(scholarHindex)) {
            if (CollectionUtils.isEmpty(scholarIds)) {
                scholarIds = scholarHindex;
            } else {
                scholarIds = (List<String>) CollectionUtils.intersection(scholarIds, scholarHindex);
            }
        }
        if (CollectionUtils.isNotEmpty(scholarQindex)) {
            if (CollectionUtils.isEmpty(scholarIds)) {
                scholarIds = scholarQindex;
            } else {
                scholarIds = (List<String>) CollectionUtils.intersection(scholarIds, scholarQindex);
            }
        }
        if (scholarIds.size() > 10000) {
            return scholarIds.subList(0, 10000);
        }
        return scholarIds;
    }
}

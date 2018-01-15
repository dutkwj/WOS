package org.thealpha.dao.imple;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.filter.ValueFilter;
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

import java.io.IOException;
import java.util.*;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Repository
public class ScholarInfoDaoImpl implements ScholarInfoDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

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
                        scholar.setAff(value);
                    } else if (ConfigurationConstant.QF_LAT_LNG.equals(qualiFier)) {
                        scholar.setLatlng(value);
                        scholar.setLatitude(value.split(", ")[0]);
                        scholar.setLongitude(value.split(", ")[1]);
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
                scholar.setIndex(scholarId);
                scholar.setName(name);
                scholar.setAff(aff);
                if (StringUtils.isNotBlank(latlng)) {
                    scholar.setLatlng(latlng);
                    scholar.setLatitude(latlng.split(", ")[0]);
                    scholar.setLongitude(latlng.split(", ")[1]);
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
        Set<String> scholarNameIndex = null;
        if (StringUtils.isNotBlank(searchItem.getScholarName())) {
            scholarNameIndex = new HashSet<String>();
            scan.setFilter(new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator(searchItem.getScholarName())));
            scan.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME));
            ResultScanner resultScanner = table.getScanner(scan);
            for (Result result : resultScanner) {
                scholarNameIndex.add(Bytes.toString(result.getRow()));
            }
        }
        Set<String> scholarAffIndex = null;
        if (StringUtils.isNotBlank(searchItem.getAffName())) {
            scholarAffIndex = new HashSet<String>();
            scan.setFilter(new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator(searchItem.getAffName())));
            scan.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF));
            ResultScanner resultScanner = table.getScanner(scan);
            for (Result result : resultScanner) {
                scholarAffIndex.add(Bytes.toString(result.getRow()));
            }
        }
        HbaseUtils.closeTableAndConn(table, connection);

        List<String> scholarIds = null;
        if (CollectionUtils.isNotEmpty(scholarNameIndex) && CollectionUtils.isNotEmpty(scholarAffIndex)) {
            scholarIds = (List<String>) CollectionUtils.intersection(scholarNameIndex, scholarAffIndex);
        } else if (CollectionUtils.isNotEmpty(scholarNameIndex)) {
            scholarIds = new ArrayList<String>();
            for (String scholarId : scholarNameIndex) {
                scholarIds.add(scholarId);
            }
        } else if (CollectionUtils.isNotEmpty(scholarAffIndex)) {
            scholarIds = new ArrayList<String>();
            for (String scholarId : scholarAffIndex) {
                scholarIds.add(scholarId);
            }
        }
        return scholarIds;
    }
}

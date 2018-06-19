package org.thealpha.dao.imple;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.model.Cooperater;
import org.thealpha.model.FirstCoYear;
import org.thealpha.model.Scholar;
import org.thealpha.model.YearCount;
import org.thealpha.util.ConfigurationConstant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by kangwenjie on 17-12-14.
 */
@Repository
public class ScholarCooperateDaoImpl implements ScholarCooperateDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

    public Map<String, String> getAllCooperateScholar() {
        Connection connection = null;
        Table table = null;
        Result[] results = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        List<Get> gets = new ArrayList<Get>();
        Get get1 = new Get(Bytes.toBytes("0DE9F497"));
        Get get2 = new Get(Bytes.toBytes("80E2C811"));
        Get get3 = new Get(Bytes.toBytes("7FC8CD3A"));
        Get get4 = new Get(Bytes.toBytes("82B4E787"));
        Get get5 = new Get(Bytes.toBytes("80E2C818"));
        get1.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT));
        get2.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT));
        get3.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT));
        get4.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT));
        get5.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT));
        gets.add(get1);
        gets.add(get2);
        gets.add(get3);
        gets.add(get4);
        gets.add(get5);
        HashMap<String, String> map = new HashMap<String, String>();
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            results = table.get(gets);
            for (Result result : results) {
                for (Cell cell : result.rawCells()) {
                    String rowKey = new String(CellUtil.cloneRow(cell));
                    String cooperate = new String(CellUtil.cloneValue(cell));
                    map.put(rowKey, cooperate);
                }
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
        return map;
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

    @Override
    public List<Cooperater> getMVCsById(String id) {
        List<Cooperater> result = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, id, new RowMapper<List<Cooperater>>() {
            public List<Cooperater> mapRow(Result result, int i) throws Exception {
                List<Cooperater> cooperaterList = new ArrayList<Cooperater>();
                String MVC = Bytes.toString(result.getValue(ConfigurationConstant.CF_COOPERATE.getBytes(), ConfigurationConstant.QF_MVCS.getBytes()));
                if (MVC != null && !"".equals(MVC)) {
                    String[] MVCs = MVC.split(", ");
                    for (String m : MVCs) {
                        Cooperater cooperater = new Cooperater();
                        cooperater.setIndex(m);
                        cooperaterList.add(cooperater);
                    }
                }
                return  cooperaterList;
            }
        });
        return result;
    }

    public List<YearCount> getCooperateYearCountsById(String id) {
        List<YearCount> result = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, id, new RowMapper<List<YearCount>>() {
            public List<YearCount> mapRow(Result result, int i) throws Exception {
                List<YearCount> cooperateYearCountList = new ArrayList<YearCount>();
                String eveYearCount = Bytes.toString(result.getValue(ConfigurationConstant.CF_COOPERATE.getBytes(), ConfigurationConstant.QF_EVE_YEAR_COUNT.getBytes()));
                if (StringUtils.isNotBlank(eveYearCount)) {
                    String[] eveYearCounts = eveYearCount.split(", ");
                    for (String eve : eveYearCounts) {
                        YearCount yearCount = new YearCount();
                        int count = Integer.parseInt(eve.substring(eve.indexOf(":") + 1, eve.length()));
                        if (count != 0) {
                            yearCount.setYear(Integer.parseInt(eve.substring(0, eve.indexOf(":"))));
                            yearCount.setCount(count);
                            cooperateYearCountList.add(yearCount);
                        }
                    }
                }
                return  cooperateYearCountList;
            }
        });
        return result;
    }
    public List<FirstCoYear> getFirstCooperateYearById(String id) {
        List<FirstCoYear> result = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, id, new RowMapper<List<FirstCoYear>>() {
            public List<FirstCoYear> mapRow(Result result, int i) throws Exception {
                List<FirstCoYear> firstcooperateYearList = new ArrayList<FirstCoYear>();
                String firstcooperateYear = Bytes.toString(result.getValue(ConfigurationConstant.CF_COOPERATE.getBytes(), ConfigurationConstant.QF_FIRST_COOPERATE_YEAR.getBytes()));
                if (StringUtils.isNotBlank(firstcooperateYear)) {
                    String[] FirstCoYear = firstcooperateYear.split(", ");
                    for (String eve : FirstCoYear) {
                        FirstCoYear firstCoYear = new FirstCoYear();
                        int count = Integer.parseInt(eve.substring(eve.indexOf(":") + 1, eve.length()));
                        if (count != 0) {
                            firstCoYear.setCooperate(eve.substring(0, eve.indexOf(":")));
                            firstCoYear.setYear(count);
                            firstcooperateYearList.add(firstCoYear);
                        }
                    }
                }
                return  firstcooperateYearList;
            }
        });
        return result;
    }
}

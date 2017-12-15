package org.thealpha.dao.imple;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.stereotype.Repository;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;
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
public class ScholarInfoDaoImpl implements ScholarInfoDao{

    public List<String> getRecommendScholars() {
        List<String> recommendScholars = new ArrayList<String>();
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


        return recommendScholars;
    }

    public Map<String, Scholar> getScholarByIds(List<String> ids) {
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        Connection connection = null;
        Table table = null;
        Result[] results = null;

        List<Get> gets = new ArrayList<Get>();
        for (String id : ids) {
            Get get = new Get(Bytes.toBytes(id));
            get.addFamily(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO));
            gets.add(get);

        }
        HashMap<String, Scholar> map = new HashMap<String, Scholar>();
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
                    }
                }
                map.put(scholar.getIndex(), scholar);
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
}

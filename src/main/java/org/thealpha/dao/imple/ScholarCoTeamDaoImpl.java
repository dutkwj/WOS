package org.thealpha.dao.imple;

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
import org.thealpha.dao.inter.ScholarCoTeamDao;
import org.thealpha.dao.inter.ScholarCooperateDao;
import org.thealpha.model.Cooperater;
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
public class ScholarCoTeamDaoImpl implements ScholarCoTeamDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;


    public List<Cooperater> getCooperatersById(String id) {
//        Connection connection = null;
//        Table table = null;
//        Result result = null;
//        Configuration conf = HBaseConfiguration.create();
//        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
//        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
//        Get get = new Get(Bytes.toBytes(id));
//        get.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT));
//        Cooperater cooperater = new Cooperater();
//        try {
//            connection = ConnectionFactory.createConnection(conf);
//            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
//            result = table.get(get);
//            for (Cell cell : result.rawCells()) {
//                String rowKey = new String(CellUtil.cloneRow(cell));
//                cooperater.setIndex(rowKey);
//                String cooperate = new String(CellUtil.cloneValue(cell));
//                if (cooperate != null && !"".equals(cooperate)) {
//                    String[] cooperates = cooperate.split(", ");
//                    for (String co : cooperates) {
//                        cooperater.setName(co.substring(0, co.indexOf(":")));
//                        cooperater.setCount(Integer.parseInt(co.substring(co.indexOf(":") + 1, co.length())));
//                    }
//                    System.out.print(cooperater.getName() + cooperater.getCount());
//                }
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                table.close();
//                connection.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        return cooperater;
        List<Cooperater> result = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_RELATIONSHIP, id, new RowMapper<List<Cooperater>>() {
            public List<Cooperater> mapRow(Result result, int i) throws Exception {
                List<Cooperater> coTeamerList = new ArrayList<Cooperater>();
                String coTeamer = Bytes.toString(result.getValue(ConfigurationConstant.CF_CO_TEAM.getBytes(), ConfigurationConstant.QF_TEAM_INTENSION.getBytes()));
                if (coTeamer != null && !"".equals(coTeamer)) {
                    String[] cooperates = coTeamer.split(", ");
                    for (String co : cooperates) {
                        Cooperater cooperater = new Cooperater();
                        cooperater.setIndex(co.substring(0, co.indexOf(":")));
                        cooperater.setIntension(Double.parseDouble(co.substring(co.indexOf(":") + 1, co.length())));
                        coTeamerList.add(cooperater);
                    }
                }
                return  coTeamerList;
            }
        });
        return result;
    }
}

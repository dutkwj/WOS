package org.thealpha.dao.imple;

import org.apache.commons.collections.CollectionUtils;
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
import org.thealpha.dao.inter.PaperDao;
import org.thealpha.util.ConfigurationConstant;

import java.io.IOException;
import java.util.*;

/**
 * Created by kangwenjie on 17-12-16.
 */
@Repository
public class PaperDaoImpl implements PaperDao{
    @Autowired
    private HbaseTemplate hbaseTemplate;

    public List<String> getPaperIdsByAuthorId(String authorId) {
        //System.out.println(authorId);
        List<String> paperIds = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_SCHOLAR, authorId, new RowMapper<List<String>>() {
            public List<String> mapRow(Result result, int rowNum) throws Exception {
                String paperIds = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_PAPERS), Bytes.toBytes(ConfigurationConstant.QF_PAPER_IDS)));
                if (StringUtils.isNotBlank(paperIds)) {
                    String[] ids = paperIds.split(", ");
                    return Arrays.asList(ids);
                }
                return null;
            }
        });
        return paperIds;
    }

    public List<String> getAuthorIdsByPaperId(String paperId) {
        List<String> authorIds = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_PAPER, paperId, new RowMapper<List<String>>() {
            public List<String> mapRow(Result result, int rowNum) throws Exception {
                String authorIds = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_AUTHORS), Bytes.toBytes(ConfigurationConstant.QF_AUTHOR_IDS)));
                if (StringUtils.isNotBlank(authorIds)) {
                    String[] ids = authorIds.split(", ");
                    return Arrays.asList(ids);
                }
                return null;
            }
        });
        return authorIds;
    }

    public List<String> getAuthorIdsByPaperIds(List<String> paperIds) {
        if (CollectionUtils.isEmpty(paperIds)) {
            return null;
        }
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        Connection connection = null;
        Table table = null;
        Result[] results = null;

        List<Get> gets = new ArrayList<Get>();
        for (String id : paperIds) {
            Get get = new Get(Bytes.toBytes(id));
            get.addColumn(Bytes.toBytes(ConfigurationConstant.CF_AUTHORS), Bytes.toBytes(ConfigurationConstant.QF_AUTHOR_IDS));
            gets.add(get);

        }
        List<String> authorIdList = new ArrayList<String>();
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            results = table.get(gets);
            for (Result result : results) {
                for (Cell cell : result.rawCells()) {
                    String value = new String(CellUtil.cloneValue(cell));
                    if (StringUtils.isNotBlank(value)) {
                        String[] idsComma = value.split(", ");
                        for (String id : idsComma) {
                            if (!authorIdList.contains(id)) {
                                authorIdList.add(id);
                            }
                        }
                    }
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
        return authorIdList;
    }

    public Map<String, List<String>> getPaperIdAuthorIdsMapByPaperIds(List<String> paperIds) {
        if (CollectionUtils.isEmpty(paperIds)) {
            return null;
        }
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        Connection connection = null;
        Table table = null;
        Result[] results = null;

        List<Get> gets = new ArrayList<Get>();
        for (String id : paperIds) {
            Get get = new Get(Bytes.toBytes(id));
            get.addColumn(Bytes.toBytes(ConfigurationConstant.CF_AUTHORS), Bytes.toBytes(ConfigurationConstant.QF_AUTHOR_IDS));
            gets.add(get);

        }
        Map<String, List<String>> paperIdAuthorIds = new HashMap<String, List<String>>();
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            results = table.get(gets);
            for (Result result : results) {
                for (Cell cell : result.rawCells()) {
                    String rowKey = new String(CellUtil.cloneRow(cell));
                    String value = new String(CellUtil.cloneValue(cell));

                    List<String> authorIdList = new ArrayList<String>();
                    if (StringUtils.isNotBlank(value)) {
                        String[] idsComma = value.split(", ");
                        for (String id : idsComma) {
                            if (!authorIdList.contains(id)) {
                                authorIdList.add(id);
                            }
                        }
                    }
                    paperIdAuthorIds.put(rowKey, authorIdList);
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
        return paperIdAuthorIds;
    }
}

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
import org.thealpha.dao.inter.ReferenceDao;
import org.thealpha.model.Paper;
import org.thealpha.model.Scholar;
import org.thealpha.util.ConfigurationConstant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-16.
 */
@Repository
public class ReferenceDaoImpl implements ReferenceDao{

    @Autowired
    private HbaseTemplate hbaseTemplate;

    public List<String> getRefPaperIdsByPaperId(String paperId) {
        List<String> refPaperIds = hbaseTemplate.get(ConfigurationConstant.TABLE_CS_PAPER, paperId, new RowMapper<List<String>>() {
            public List<String> mapRow(Result result, int rowNum) throws Exception {
                String refPaperIds = Bytes.toString(result.getValue(Bytes.toBytes(ConfigurationConstant.CF_REFERENCE), Bytes.toBytes(ConfigurationConstant.QF_REF_IDS)));
                if (StringUtils.isNotBlank(refPaperIds)) {
                    String[] ids = refPaperIds.split(", ");
                    return Arrays.asList(ids);
                }
                return null;
            }
        });
        return refPaperIds;
    }

    public List<String> getRefPaperIdsByPaperIdsAndRefType(List<String> paperIds, String refType) {
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
            get.addColumn(Bytes.toBytes(ConfigurationConstant.CF_REFERENCE), Bytes.toBytes(refType));
            gets.add(get);

        }
        List<String> refPaperIdList = new ArrayList<String>();
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            results = table.get(gets);
            for (Result result : results) {
                for (Cell cell : result.rawCells()) {
                    String value = new String(CellUtil.cloneValue(cell));
                    if (StringUtils.isNotBlank(value)) {
                        refPaperIdList.add(value);
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
        return refPaperIdList;
    }

    public List<String> getRefPaperIdsByPaperIds(List<String> paperIds) {
        List<String> refPaperIdList = getRefPaperIdsByPaperIdsAndRefType(paperIds, ConfigurationConstant.QF_REF_IDS);
        if (CollectionUtils.isEmpty(refPaperIdList)) {
            return null;
        }
        List<String> refIds = new ArrayList<String>();
        for (String idsComma : refPaperIdList) {
            String[] ids = idsComma.split(", ");
            refIds.addAll(Arrays.asList(ids));
        }
        return refIds;
    }

    public List<String> getRefedPaperIdsByPaperIds(List<String> paperIds) {
        List<String> refPaperedIdList = getRefPaperIdsByPaperIdsAndRefType(paperIds, ConfigurationConstant.QF_REFED_IDS);
        if (CollectionUtils.isEmpty(refPaperedIdList)) {
            return null;
        }
        List<String> refedIds = new ArrayList<String>();
        for (String idsComma : refPaperedIdList) {
            String[] ids = idsComma.split(", ");
            refedIds.addAll(Arrays.asList(ids));
        }
        return refedIds;
    }

    public List<String> getCoRefPapersByPaperIds(List<String> paperIds) {
        List<String> coRefPapersList = getRefPaperIdsByPaperIdsAndRefType(paperIds, ConfigurationConstant.QF_CO_REF_IDS);
        if (CollectionUtils.isEmpty(coRefPapersList)) {
            return null;
        }
        List<String> coRefs = new ArrayList<String>();
        for (String idsComma : coRefPapersList) {
            String[] idAndCounts = idsComma.split(", ");
            coRefs.addAll(Arrays.asList(idAndCounts));
        }
        return coRefs;
    }

    public List<String> getCoRefedPapersByPaperIds(List<String> paperIds) {
        List<String> coRefedPapersList = getRefPaperIdsByPaperIdsAndRefType(paperIds, ConfigurationConstant.QF_CO_REFED_IDS);
        if (CollectionUtils.isEmpty(coRefedPapersList)) {
            return null;
        }
        List<String> coRefeds = new ArrayList<String>();
        for (String idsComma : coRefedPapersList) {
            String[] idAndCounts = idsComma.split(", ");
            coRefeds.addAll(Arrays.asList(idAndCounts));
        }
        return coRefeds;
    }
}

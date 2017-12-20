package org.thealpha.util;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Table;

import java.io.IOException;

/**
 * Created by kangwenjie on 17-12-19.
 */
public class HbaseUtils {
    public static Configuration getConf() {
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        return conf;
    }

    public static Connection getConnection() throws IOException {
        return ConnectionFactory.createConnection(getConf());
    }

    public static Table getTable(String tableName, Connection connection) throws IOException {
        return connection.getTable(TableName.valueOf(tableName));
    }

    public static void closeTableAndConn(Table table, Connection connection) throws IOException {
        table.close();
        connection.close();
    }
}

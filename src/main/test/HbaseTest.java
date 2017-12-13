import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.util.Bytes;
import org.junit.Test;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.*;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-servlet.xml")
public class HbaseTest {
    private static final String TABLE_NAME    = "cs_scholar";
    private static final String ROW_KEY       = "r";
    private static final String COLUMN_FAMILY = "relationship";
    private static final String QUALIFIER     = "cooperate";

    @Autowired
    private HbaseTemplate hbaseTemplate;

    @Test
    public void test() {
        // 加载Spring配置文件
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-servlet.xml");
        // 获取HbaseTemplate
        HbaseTemplate hbaseTemplate = (HbaseTemplate) applicationContext.getBean("hbaseTemplate");
        // 通过表名和rowKey获取最近一行数据
        String result = hbaseTemplate.get(TABLE_NAME, ROW_KEY, new RowMapper<String>() {
            public String mapRow(org.apache.hadoop.hbase.client.Result result, int i) throws Exception {
                return Bytes.toString(result.getValue(COLUMN_FAMILY.getBytes(), QUALIFIER.getBytes()));
            }
        });
        System.out.println(result); // 输出结果是：value1
    }

//    @Test
//    public void titanTest(){
//        BaseConfiguration baseConfiguration = new BaseConfiguration();
//        baseConfiguration.setProperty("storage.backend", "hbase");
//        baseConfiguration.setProperty("storage.hostname", "127.0.0.1");
//        baseConfiguration.setProperty("storage.tablename","titan");
//        baseConfiguration.setProperty("index.search.backend","elasticsearch");
//        baseConfiguration.setProperty("index.search.hostname","127.0.0.1");
//
//        TitanGraph titanGraph = TitanFactory.open(baseConfiguration);
//        GraphTraversalSource g = titanGraph.traversal();
//        Vertex saturn = g.V().has("name", "saturn").next();
//        System.out.print(saturn);
//    }

    @Test
    public void importCooperateScholarTest() {
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-servlet.xml");
//        HbaseTemplate hbaseTemplate = (HbaseTemplate) applicationContext.getBean("hbaseTemplate");
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_co_author_count_list.csv");  // CSV文件路径
        BufferedReader br = null;
        try
        {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        // 787016   4CDAA40  1514846 9CE917C
        try {
            while ((line = br.readLine()) != null)  //读取到的内容给line变量
            {
                count += 1;
//                if (count <= 1514846) {
//                    System.out.println(count);
//                    continue;
//                }
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String cooperateAuthors = line.substring(line.indexOf(",") + 1);
                cooperateAuthors = cooperateAuthors.replaceAll("\"|\\[|\\]|'", "");
                hbaseTemplate.put(TABLE_NAME, authorId, COLUMN_FAMILY, QUALIFIER, cooperateAuthors.getBytes());

                System.out.println(count);
                System.out.println(authorId);
                System.out.println(cooperateAuthors);

            }
        } catch (IOException e)
        {
            e.printStackTrace();
        }

    }
    @Test
    public void testTempldate() {
        //可行FC81526    不可行0D8CD80
        String result = hbaseTemplate.get("cs_scholar", "0D8CD80", new RowMapper<String>() {
            public String mapRow(org.apache.hadoop.hbase.client.Result result, int i) throws Exception {
                return Bytes.toString(result.getValue("relationship".getBytes(), "cooperate".getBytes()));
            }
        });

        System.out.println(result); // 输出结果是：value1
//        hbaseTemplate.put("testTable", "r1", "cf", "q2", "value2".getBytes());

    }

    @Test
    public void testHTable() {
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", "100.66.1.209,100.66.2.1,100.66.2.22");
        conf.set("hbase.zookeeper.property.clientPort", "2181");
        Get get = new Get(Bytes.toBytes("r3"));
        try {
            HTable table = new HTable(conf, Bytes.toBytes("testTable3"));
            org.apache.hadoop.hbase.client.Result result = table.get(get);
            for (KeyValue kv : result.list()) {
                System.out.println("family:" + Bytes.toString(kv.getFamily()));
                System.out
                        .println("qualifier:" + Bytes.toString(kv.getQualifier()));
                System.out.println("value:" + Bytes.toString(kv.getValue()));
                System.out.println("Timestamp:" + kv.getTimestamp());
                System.out.println("-------------------------------------------");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test1() {
        System.out.print("111");
    }

}

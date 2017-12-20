import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.filter.*;
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
import org.thealpha.util.ConfigurationConstant;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-servlet.xml")
public class HbaseTest {
    private static final String TABLE_NAME    = "cs_scholar";
    private static final String ROW_KEY       = "r";
    private static final String COLUMN_FAMILY = "info";
    private static final String QUALIFIER     = "name";

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
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("a", "av");
        map.put("b", "bv");
        for (Map.Entry entry : map.entrySet()) {
            System.out.print(entry.getKey());
            System.out.print(entry.getValue());
        }
        System.out.print("111");
    }

    @Test
    public void importScholarNameTest() {
        HashMap<String, String> authorIdName = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_name.csv");  // CSV文件路径
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)  //读取到的内容给line变量
            {
                count += 1;
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String name = line.substring(line.indexOf(",") + 1);
                authorIdName.put(authorId, name);
                System.out.println(count);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdName.entrySet()) {
            String authorId = (String) entry.getKey();
            String name = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_NAME), Bytes.toBytes(name));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void getResultScanTest() {

        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", "100.66.1.209,100.66.2.1,100.66.2.22");
        conf.set("hbase.zookeeper.property.clientPort", "2181");

        List<Get> gets = new ArrayList<Get>();
        Get get1 = new Get(Bytes.toBytes("r1"));
//        Get get2 = new Get(Bytes.toBytes("r2"));
//        Get get3 = new Get(Bytes.toBytes("r3"));
//        Get get4 = new Get(Bytes.toBytes("r4"));
//        Get get5 = new Get(Bytes.toBytes("r5"));
        get1.addFamily(Bytes.toBytes("cf"));
        gets.add(get1);
//        gets.add(get2);
//        gets.add(get3);
//        gets.add(get4);
//        gets.add(get5);

        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf("testTable"));
//            results = table.getScanner(Bytes.toBytes("cf"), Bytes.toBytes("q1"));
            org.apache.hadoop.hbase.client.Result[] rs = table.get(gets);
            for (org.apache.hadoop.hbase.client.Result result : rs) {
                for (Cell cell : result.rawCells()) {
                    System.out.println(
                            "行键:" + new String(CellUtil.cloneRow(cell)) + "\t" +
                                    "列族:" + new String(CellUtil.cloneFamily(cell)) + "\t" +
                                    "列名:" + new String(CellUtil.cloneQualifier(cell)) + "\t" +
                                    "值:" + new String(CellUtil.cloneValue(cell)) + "\t" +
                                    "时间戳:" + cell.getTimestamp());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
//            results.close();
            try {
                table.close();
                connection.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void importRSCooperate() {
        HashMap<String, String> authorCoAuthorCount = new HashMap<String, String>();
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
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String cooperateAuthors = line.substring(line.indexOf(",") + 1);
                cooperateAuthors = cooperateAuthors.replaceAll("\"|\\[|\\]|'", "");
                authorCoAuthorCount.put(authorId, cooperateAuthors);
                System.out.println(count);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorCoAuthorCount.entrySet()) {
            String authorId = (String) entry.getKey();
            String cooperateCounts = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_COOPERATE), Bytes.toBytes(ConfigurationConstant.QF_COUNT), Bytes.toBytes(cooperateCounts));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_RELATIONSHIP));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importAuthorIdAff() {
        HashMap<String, String> authorIdAff = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_aff.csv");  // CSV文件路径
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
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                if (count <= 11) {
                    continue;
                }
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(",")).replace("\n", "");
                String aff = line.substring(line.indexOf(",") + 1).replaceAll("\"", "");
                if (aff != null && !aff.equals("")) {
                    authorIdAff.put(authorId, aff);

                }
                System.out.println(count);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdAff.entrySet()) {
            String authorId = (String) entry.getKey();
            String aff = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PERSONAL_INFO), Bytes.toBytes(ConfigurationConstant.QF_AFF), Bytes.toBytes(aff));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void addCFTest() throws IOException {
        // Instantiating configuration class.
        Configuration conf = HBaseConfiguration.create();

        // Instantiating HBaseAdmin class.
        HBaseAdmin admin = new HBaseAdmin(conf);

        // Instantiating columnDescriptor class
        HColumnDescriptor columnDescriptor = new HColumnDescriptor(ConfigurationConstant.CF_PAPERS);

        // Adding column family
        admin.addColumn(ConfigurationConstant.TABLE_CS_SCHOLAR, columnDescriptor);
        System.out.println("coloumn added");
    }

    @Test
    public void importPaperIds() {
        HashMap<String, String> authorIdPaperIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_author_id_paper_ids.csv");  // CSV文件路径
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
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                if (count <= 11) {
                    continue;
                }
                String authorId = line.substring(0, line.indexOf(","));
                String paperIds = line.substring(line.indexOf(",") + 1);
                paperIds = paperIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                authorIdPaperIds.put(authorId, paperIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : authorIdPaperIds.entrySet()) {
            String authorId = (String) entry.getKey();
            String paperIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(authorId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_PAPERS), Bytes.toBytes(ConfigurationConstant.QF_PAPER_IDS), Bytes.toBytes(paperIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_SCHOLAR));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importPaperAuthors() {
        HashMap<String, String> paperIdAuthorIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_paper_authors.csv");  // CSV文件路径
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
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String paperId = line.substring(0, line.indexOf(","));
                String authorIds = line.substring(line.indexOf(",") + 1);
                authorIds = authorIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                paperIdAuthorIds.put(paperId, authorIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : paperIdAuthorIds.entrySet()) {
            String paperId = (String) entry.getKey();
            String authorIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(paperId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_AUTHORS), Bytes.toBytes(ConfigurationConstant.QF_AUTHOR_IDS), Bytes.toBytes(authorIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importPaperRef() {
        HashMap<String, String> paperIdRefIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_paper_cs_refed.csv");  // CSV文件路径
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
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String paperId = line.substring(0, line.indexOf(","));
                String refIds = line.substring(line.indexOf(",") + 1);
                refIds = refIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                paperIdRefIds.put(paperId, refIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : paperIdRefIds.entrySet()) {
            String paperId = (String) entry.getKey();
            String refIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(paperId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_REFERENCE), Bytes.toBytes(ConfigurationConstant.QF_REF_IDS), Bytes.toBytes(refIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void importCoPaperRef() {
        HashMap<String, String> paperIdRefIds = new HashMap<String, String>();
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_paper_cs_co_ref3.csv");  // CSV文件路径
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
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String paperId = line.substring(0, line.indexOf(","));
                String refIds = line.substring(line.indexOf(",") + 1);
                refIds = refIds.replaceAll("\"|\\[|\\]|'", "");
                System.out.println(count);
                paperIdRefIds.put(paperId, refIds);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);

        List<Put> puts = new ArrayList<Put>();
        for (Map.Entry entry : paperIdRefIds.entrySet()) {
            String paperId = (String) entry.getKey();
            String refIds = (String) entry.getValue();
            Put put = new Put(Bytes.toBytes(paperId));
            put.addColumn(Bytes.toBytes(ConfigurationConstant.CF_REFERENCE), Bytes.toBytes(ConfigurationConstant.QF_CO_REFED_IDS), Bytes.toBytes(refIds));
            puts.add(put);
        }
        try {
            connection = ConnectionFactory.createConnection(conf);
            table = connection.getTable(TableName.valueOf(ConfigurationConstant.TABLE_CS_PAPER));
            table.put(puts);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void filterTest() throws IOException {
        Connection connection = null;
        Table table = null;
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum", ConfigurationConstant.ZK_QUORUM);
        conf.set("hbase.zookeeper.property.clientPort", ConfigurationConstant.ZK_CLIENT_PORT);
        Scan scan = new Scan();
        Filter filter1 = new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator("def"));
//        Filter filter2 = new ValueFilter(CompareFilter.CompareOp.EQUAL, new SubstringComparator("def1"));
        scan.setFilter(filter1);
//        scan.setFilter(filter2);
//        scan.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("num"));
//        scan.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("num1"));
        connection = ConnectionFactory.createConnection(conf);
        table = connection.getTable(TableName.valueOf("testTable"));
        ResultScanner resultScanner = table.getScanner(scan);
        for (org.apache.hadoop.hbase.client.Result result : resultScanner) {
            System.out.print(Bytes.toString(result.getRow()));
//            for (Cell cell : result.rawCells()) {
//                System.out.println(new String(CellUtil.cloneRow(cell)));
//            }
        }
    }

}

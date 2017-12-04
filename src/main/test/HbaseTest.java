import com.thinkaurelius.titan.core.TitanFactory;
import com.thinkaurelius.titan.core.TitanGraph;
import org.apache.commons.configuration.BaseConfiguration;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.tinkerpop.gremlin.process.traversal.dsl.graph.GraphTraversalSource;
import org.apache.tinkerpop.gremlin.structure.Edge;
import org.apache.tinkerpop.gremlin.structure.Vertex;
import org.junit.Test;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.*;
import java.util.List;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = "/WEB-INF/applicationContext.xml")
public class HbaseTest {
    private static final String TABLE_NAME    = "scholar";
    private static final String ROW_KEY       = "row4";
    private static final String COLUMN_FAMILY = "relationship";
    private static final String QUALIFIER     = "cooperate";
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

    @Test
    public void titanTest(){
        BaseConfiguration baseConfiguration = new BaseConfiguration();
        baseConfiguration.setProperty("storage.backend", "hbase");
        baseConfiguration.setProperty("storage.hostname", "127.0.0.1");
        baseConfiguration.setProperty("storage.tablename","titan");
        baseConfiguration.setProperty("index.search.backend","elasticsearch");
        baseConfiguration.setProperty("index.search.hostname","127.0.0.1");

        TitanGraph titanGraph = TitanFactory.open(baseConfiguration);
        GraphTraversalSource g = titanGraph.traversal();
        Vertex saturn = g.V().has("name", "saturn").next();
        System.out.print(saturn);
    }

    @Test
    public void importCooperateScholarTest() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-servlet.xml");
        HbaseTemplate hbaseTemplate = (HbaseTemplate) applicationContext.getBean("hbaseTemplate");
        File csv = new File("/home/kangwenjie/Documents/wos/file/cs_author_co_author_count_list.csv");  // CSV文件路径
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
            while ((line = br.readLine()) != null)  //读取到的内容给line变量
            {
                line.substring(0, line.indexOf(","));
                String authorId = line.substring(0, line.indexOf(","));
                String cooperateAuthors = line.substring(line.indexOf(",") + 1);
                cooperateAuthors = cooperateAuthors.replaceAll("\"|\\[|\\]|'", "");
                System.out.print(cooperateAuthors+"   ");
                hbaseTemplate.put(TABLE_NAME, authorId, COLUMN_FAMILY, QUALIFIER, cooperateAuthors.getBytes());

                count += 1;
                System.out.println(count);
            }
        } catch (IOException e)
        {
            e.printStackTrace();
        }

    }
    @Test
    public void t1() {
        String s1 = "\\[";
        System.out.print(s1);
    }


}

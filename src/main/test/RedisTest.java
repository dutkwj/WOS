import org.apache.hadoop.hbase.util.Bytes;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.thealpha.model.Scholar;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/redis/spring-redis.xml")
public class RedisTest {

    private Jedis jedis;

    @Autowired
    private JedisCluster jedisCluster;

//    @Before
//    public void setup() {
//        jedis = new Jedis("100.66.2.1", 6379);
//    }

    @Test
    public void redisConnectTest() {
//        jedisCluster.set("name", "123");
//        System.out.println(jedis.get("name"));
        System.out.println(jedisCluster.get("hello"));
    }

    @Test
    public void redisListTest() {
//        jedisCluster.lpush("testList", "l1");
//        jedisCluster.lpush("testList", "l2");
//        jedisCluster.lpush("testList", "l3");
//        System.out.println(jedisCluster.get("testList"));
//        System.out.println(jedisCluster.lrange("testList", 0, -1));
//        jedisCluster.del("testList");

//        Scholar s1 = new Scholar();
//        Scholar s2 = new Scholar();
//        Scholar s3 = new Scholar();
//        Scholar s4 = new Scholar();
//        s1.setHindex(10);
//        s2.setHindex(5);
//        s3.setHindex(20);
//        List<Scholar> scholars = new ArrayList<Scholar>();
//        scholars.add(s4);
//        scholars.add(s1);
//        scholars.add(s2);
//        scholars.add(s3);
//        jedisCluster.set("testList".getBytes(), ListTranscoder.serialize(scholars));
//        for (Scholar scholar : scholars) {
//            System.out.println(scholar.getHindex());
//        }

        //验证
        byte[] in = jedisCluster.get("testList".getBytes());
        List<Scholar> list = (List<Scholar>)ListTranscoder.deserialize(in);
        for(Scholar scholar : list){
            System.out.println("testSetEnsemble scholar hindex is:" + scholar.getHindex());
        }
    }
}

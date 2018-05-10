package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.model.Scholar;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.JedisCluster;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-22.
 */
@Service
public class RankService {

    @Autowired
    private JedisCluster jedisCluster;

    public List<Scholar> getTop100Cooperators() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_COOPERATE_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100TeamMembers() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_CO_TEAM_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Students() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_STUDENTS_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100RefNumber() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_REF_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100RefedNumber() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_REFED_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100CoRef() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_CO_REF_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100CoRefed() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_CO_REFED_NUMBER_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Cooperators() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_COOPERATE_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100TeamMembers() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_CO_TEAM_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Students() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_STUDENTS_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100RefNumber() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_REF_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100RefedNumber() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_REFED_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100CoRef() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_CO_REF_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100CoRefed() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_CO_REFED_NUMBER_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }
}

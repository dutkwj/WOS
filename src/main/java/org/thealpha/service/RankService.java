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

    public List<Scholar> getTop100Potential_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_INEDX_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potential_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_INEDX_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potential_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_INEDX_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialgrowth_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_GROWTH_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialgrowth_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_GROWTH_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialgrowth_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_GROWTH_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca1_5_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_1_5_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca6_15_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_6_15_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca16_25_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_16_25_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca26_40_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_26_40_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca41_60_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_41_60_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca61_80_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_61_80_3YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca1_5_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_1_5_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca6_15_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_6_15_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca16_25_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_16_25_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca26_40_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_26_40_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca41_60_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_41_60_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca61_80_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_61_80_5YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca1_5_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_1_5_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca6_15_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_6_15_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca16_25_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_16_25_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca26_40_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_26_40_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca41_60_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_41_60_10YEARS_TOP100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getTop100Potentialaca61_80_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_61_80_10YEARS_TOP100_SCHOLARS.getBytes());
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

    public List<Scholar> getBottom100Potential_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_INEDX_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potential_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_INEDX_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potential_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_INEDX_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialgrowth_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_GROWTH_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialgrowth_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_GROWTH_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialgrowth_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_GROWTH_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca1_5_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_1_5_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca6_15_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_6_15_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca16_25_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_16_25_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca26_40_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_26_40_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca41_60_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_41_60_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca61_80_3years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_61_80_3YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca1_5_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_1_5_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca6_15_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_6_15_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca16_25_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_16_25_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca26_40_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_26_40_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potential41_60_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_41_60_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca61_80_5years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_61_80_5YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca1_5_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_1_5_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca6_15_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_6_15_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca16_25_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_16_25_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca26_40_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_26_40_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca41_60_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_41_60_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

    public List<Scholar> getBottom100Potentialaca61_80_10years() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_POTENTIAL_ACA_61_80_10YEARS_BOTTOM100_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);
    }

}

package org.thealpha.service;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.RecommendDao;
import org.thealpha.dao.inter.ScholarInfoDao;
import org.thealpha.model.Scholar;
import org.thealpha.model.ScholarWeight;
import org.thealpha.model.User;
import org.thealpha.util.ConfigurationConstant;
import org.thealpha.util.ListTranscoder;
import redis.clients.jedis.JedisCluster;

import java.util.*;

/**
 * Created by kangwenjie on 18-1-12.
 */
@Service
public class RecommendService {

    @Autowired
    private RecommendDao recommendDao;

    @Autowired
    private ScholarInfoDao scholarInfoDao;

    @Autowired
    private JedisCluster jedisCluster;

    public void addWeight(String email, String scholarIndx) {
        List<ScholarWeight> scholarWeights = recommendDao.getScholarWeightsByUser(email);
        if (CollectionUtils.isEmpty(scholarWeights)) {
            scholarWeights = new ArrayList<ScholarWeight>();
            ScholarWeight scholarWeight = new ScholarWeight();
            scholarWeight.setIndex(scholarIndx);
            scholarWeight.setWeight(1);
            scholarWeights.add(scholarWeight);
            recommendDao.setScholarWeights(email, scholarWeights);
        }
        boolean exist = false;
        for (ScholarWeight scholarWeight : scholarWeights) {
            if (scholarWeight.getIndex().equals(scholarIndx)) {
                exist = true;
                scholarWeight.setWeight(scholarWeight.getWeight() + 1);
                break;
            }
        }
        if (!exist) {
            ScholarWeight scholarWeight = new ScholarWeight();
            scholarWeight.setIndex(scholarIndx);
            scholarWeight.setWeight(1);
            scholarWeights.add(scholarWeight);
        }
        recommendDao.setScholarWeights(email, scholarWeights);
    }

    public List<Scholar> getRecommendScholar(String email) {
        List<ScholarWeight> scholarWeights = recommendDao.getScholarWeightsByUser(email);
        List<String> scholarIds = new ArrayList<String>();
        for (ScholarWeight scholarWeight : scholarWeights) {
            scholarIds.add(scholarWeight.getIndex());
        }

        //反查表
        List<User> similaryUsers = new ArrayList<User>();
        List<User> users = recommendDao.getAllScholarWeights();
        for (User user : users) {
            List<ScholarWeight> comparedSWs = user.getScholarWeights();
            for (ScholarWeight comparedSW : comparedSWs) {
                if (scholarIds.contains(comparedSW.getIndex())) {
                    similaryUsers.add(user);
                    break;
                }
            }
        }

        //余弦计算
        if (CollectionUtils.isEmpty(similaryUsers)) {
            return null;
        }
        for (User user : similaryUsers) {
            List<ScholarWeight> simScholarWeightList = user.getScholarWeights();
            user.setSimilarity(calCos(scholarWeights, simScholarWeightList));
        }

        //挑选前k个
        Collections.sort(similaryUsers, new Comparator<User>() {
            public int compare(User o1, User o2) {
                if (o1.getSimilarity() > o2.getSimilarity()) {
                    return -1;
                }
                if (o1.getSimilarity() < o2.getSimilarity()) {
                    return 1;
                }
                return 0;
            }
        });
        int k = 10 > similaryUsers.size() ? similaryUsers.size() : 10;

        //计算推荐度
        Map<String, ScholarWeight> recommendScholars = new HashMap<String, ScholarWeight>();
        for (int i = 0; i < k; i++) {
            User user = similaryUsers.get(i);
            List<ScholarWeight> scholarWeightList = user.getScholarWeights();
            for (ScholarWeight scholarWeight : scholarWeightList) {
                if (!scholarIds.contains(scholarWeight.getIndex())) {
                    if (!recommendScholars.containsKey(scholarWeight.getIndex())) {
                        ScholarWeight recomSW = new ScholarWeight();
                        recomSW.setIndex(scholarWeight.getIndex());
                        recomSW.setRecommendIndex(user.getSimilarity());
                        recommendScholars.put(scholarWeight.getIndex(), recomSW);
                    } else {
                        ScholarWeight recomSW = recommendScholars.get(scholarWeight.getIndex());
                        recomSW.setRecommendIndex(recomSW.getRecommendIndex() + user.getSimilarity());
                        recommendScholars.put(recomSW.getIndex(), recomSW);
                    }
                }
            }
        }

        //根据推荐度排序
        List<ScholarWeight> recomScholarWeights = new ArrayList<ScholarWeight>();
        for (Map.Entry<String, ScholarWeight> entry : recommendScholars.entrySet()) {
            recomScholarWeights.add(entry.getValue());
        }

        Collections.sort(recomScholarWeights, new Comparator<ScholarWeight>() {
            public int compare(ScholarWeight o1, ScholarWeight o2) {
                if (o1.getRecommendIndex() > o2.getRecommendIndex()) {
                    return -1;
                }
                if (o1.getRecommendIndex() < o2.getRecommendIndex()) {
                    return 1;
                }
                return 0;
            }
        });

        List<String> recomScholarIds = new ArrayList<String>();
        for (ScholarWeight scholarWeight : recomScholarWeights) {
            recomScholarIds.add(scholarWeight.getIndex());
        }
        return scholarInfoDao.getScholarsByIds(recomScholarIds);
    }

    public double calCos(List<ScholarWeight> a, List<ScholarWeight> b ) {
        if ((a.size() == 0) || (b.size() == 0)) {
            return 0;
        }
        double numerator = 0, denominatorA = 0, denominatorB = 0;
        Map<String, Integer> scholarWeightB = new HashMap<String, Integer>();
            for (ScholarWeight scholarWeight : b) {
            scholarWeightB.put(scholarWeight.getIndex(), scholarWeight.getWeight());
            denominatorB += (scholarWeight.getWeight() * scholarWeight.getWeight());
        }
        for (ScholarWeight scholarWeight : a) {
            if (scholarWeightB.containsKey(scholarWeight.getIndex())) {
                numerator += (scholarWeight.getWeight() * scholarWeightB.get(scholarWeight.getIndex()));
            }
            denominatorA += (scholarWeight.getWeight() * scholarWeight.getWeight());
        }

        return numerator / (Math.sqrt(denominatorA) * Math.sqrt(denominatorB));
    }

    public List<Scholar> getHindexTop10Scholars() {
        byte[] in = jedisCluster.get(ConfigurationConstant.REDIS_TOP10_SCHOLARS.getBytes());
        return (List<Scholar>) ListTranscoder.deserialize(in);

    }
}

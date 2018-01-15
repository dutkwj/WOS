package org.thealpha.dao.inter;

import org.thealpha.model.ScholarWeight;
import org.thealpha.model.User;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-12.
 */
public interface RecommendDao {
    List<ScholarWeight> getScholarWeightsByUser(String email);
    void setScholarWeights(String email, List<ScholarWeight> scholarWeights);
    List<User> getAllScholarWeights();
}

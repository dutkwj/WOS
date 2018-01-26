package org.thealpha.dao.inter;

/**
 * Created by kangwenjie on 18-1-9.
 */
public interface RegisterDao {
    void saveUser(String email, String qualifier, String field);
    boolean isEmailExist(String email);
}

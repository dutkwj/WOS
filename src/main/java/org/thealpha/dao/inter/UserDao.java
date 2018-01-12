package org.thealpha.dao.inter;

import org.thealpha.model.User;

/**
 * Created by kangwenjie on 18-1-12.
 */
public interface UserDao {
    boolean verifyUser(String email, String password);
    User getUserNameAndPhotoNameByEmail(String email);
}

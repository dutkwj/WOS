package org.thealpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thealpha.dao.inter.UserDao;
import org.thealpha.model.User;

/**
 * Created by kangwenjie on 18-1-12.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public boolean verifyUser(String email, String password) {
        return userDao.verifyUser(email, password);
    }

    public User getUserNameAndPhotoNameByEmail(String email) {
        return userDao.getUserNameAndPhotoNameByEmail(email);
    }
}

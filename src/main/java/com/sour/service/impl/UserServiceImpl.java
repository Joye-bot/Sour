package com.sour.service.impl;

import com.sour.model.domain.User;
import com.sour.repository.UserRepository;
import com.sour.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 用户业务层实现类
 *
 * @author nndmw
 * @date 2021/09/05
 */
@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * 查询所有用户
     *
     * @return {@link User}
     */
    @Override
    public User findUser() {
        final List<User> users = userRepository.findAll();
        if (users != null && users.size() > 0) {
            return users.get(0);
        }
        return new User();
    }

    /**
     * 根据用户名和密码查询，用于登录
     *
     * @param userName 用户名
     * @param userPass 密码
     * @return {@link List}<{@link User}>
     */
    @Override
    public List<User> userLoginByName(String userName, String userPass) {
        return userRepository.findByUserNameAndUserPass(userName, userPass);
    }

    /**
     * 根据邮箱和密码查询，用于登录
     *
     * @param userEmail 用户邮箱
     * @param userPass  密码
     * @return {@link List}<{@link User}>
     */
    @Override
    public List<User> userLoginByEmail(String userEmail, String userPass) {
        return userRepository.findByUserEmailAndUserPass(userEmail, userPass);
    }

    /**
     * 修改用户的状态为正常
     *
     * @return {@link User}
     */
    @Override
    public User updateUserNormal() {
        final User user = this.findUser();
        user.setLoginEnable("true");
        user.setLoginError(0);
        user.setLoginLast(new Date());
        userRepository.save(user);
        return user;
    }

    /**
     * 修改最后登录时间
     *
     * @param lastDate lastDate
     * @return {@link User}
     */
    @Override
    public User updateUserLoginLast(Date lastDate) {
        final User user = this.findUser();
        user.setLoginLast(lastDate);
        userRepository.save(user);
        return user;
    }

    /**
     * 修改/增加登录错误次数
     *
     * @return {@link Integer}
     */
    @Override
    public Integer updateUserLoginError() {
        final User user = this.findUser();
        user.setLoginError((user.getLoginError() == null ? 0 : user.getLoginError()) + 1);
        userRepository.save(user);
        return user.getLoginError();
    }

    /**
     * 修改禁用状态
     *
     * @param enable 启用
     */
    @Override
    public void updateUserLoginEnable(String enable) {
        final User user = this.findUser();
        user.setLoginEnable(enable);
        userRepository.save(user);
    }

    /**
     * 保存个人资料
     *
     * @param user 用户
     */
    @Override
    public void saveByUser(User user) {
        userRepository.save(user);
    }

    /**
     * 根据用户编号和密码查询
     *
     * @param userId   用户编号
     * @param userPass 用户密码
     * @return {@link User}
     */
    @Override
    public User findByUserIdAndUserPass(Long userId, String userPass) {
        return userRepository.findByUserIdAndUserPass(userId, userPass);
    }
}

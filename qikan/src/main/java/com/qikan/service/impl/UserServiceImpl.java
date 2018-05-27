package com.qikan.service.impl;

import com.qikan.dao.UserInfoMapper;
import com.qikan.entitys.UserInfo;
import com.qikan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Yang.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public void insertUser(UserInfo user) {
        userInfoMapper.insertUser(user);
    }

    @Override
    public void updateByUserId(UserInfo user) {
        userInfoMapper.updateByUserId(user);
    }

    @Override
    public void updateUserPassword(UserInfo user) {
        userInfoMapper.updateUserPassword(user);
    }

    @Override
    public void updateUserStatus(UserInfo user) {
        userInfoMapper.updateUserStatus(user);
    }

    @Override
    public UserInfo getUserById(Integer id) {
        return userInfoMapper.getUserById(id);
    }

    @Override
    public UserInfo getUser(UserInfo user) {
        return userInfoMapper.getUser(user);
    }

    @Override
    public UserInfo getUserByUserName(UserInfo user) {
        return userInfoMapper.getUserByUserName(user);
    }

    @Override
    public List<UserInfo> getUsers(UserInfo user) {
        return userInfoMapper.getUsers(user);
    }

    @Override
    public void deleteUserById(Integer id) {
        deleteUserById(id);
    }

    @Override
    public List<UserInfo> getUserByTypeId(Integer typeid) {
        return userInfoMapper.getUserByTypeId(typeid);
    }
}

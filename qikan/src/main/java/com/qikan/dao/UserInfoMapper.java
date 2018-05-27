package com.qikan.dao;

import com.qikan.entitys.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    /**
     * 插入用户(作者、编辑、专家)
     * @param user
     */
    public void insertUser(UserInfo user);

    /**
     * 修改用户信息(作者、编辑、专家)
     * @param user
     */
    public void updateByUserId(UserInfo user);

    /**
     * 修改密码(作者、编辑、专家)
     * @param user
     */
    public void updateUserPassword(UserInfo user);

    /**
     * 修改状态(作者、编辑、专家)
     * @param user
     */
    public void updateUserStatus(UserInfo user);

    /**
     * 根据Id查询用户
     * @param id
     * @return
     */
    public UserInfo getUserById(Integer id);

    /**
     * 查询用户(username,password,roleId)
     * @param user
     * @return
     */
    public UserInfo getUser(UserInfo user);

    /**
     * 查询用户(username)
     * @param user
     * @return
     */
    public UserInfo getUserByUserName(UserInfo user);

    /**
     * 查询用户(userId)
     * @param user
     * @return
     */
    public UserInfo getUserById(UserInfo user);


    /**
     * 查询用户(roleId)(按角色查询)
     */
    public List<UserInfo> getUsers(UserInfo user);

    /**
     * 查询用户通过所属类别(专家)
     * @param typeid
     * @return
     */
    public  List<UserInfo> getUserByTypeId(Integer typeid);


    /**
     * 删除用户
     * @param id
     */
    public void deleteUserById(Integer id);
}
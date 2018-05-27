package com.qikan.dao;

import com.qikan.entitys.Admin;

public interface AdminMapper {

    /**
     * 登录
     * @return
     */
    public Admin login(Admin admin);

    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}
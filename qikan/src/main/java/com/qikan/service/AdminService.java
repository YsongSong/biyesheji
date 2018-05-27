package com.qikan.service;

import com.qikan.entitys.Admin;

/**
 * 主编service
 * Created by Yang.
 */
public interface AdminService {

    /**
     * 主编登录
     * @param admin
     * @return
     */
    public Admin login(Admin admin);
}

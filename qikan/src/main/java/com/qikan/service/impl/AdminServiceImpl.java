package com.qikan.service.impl;

import com.qikan.dao.AdminMapper;
import com.qikan.entitys.Admin;
import com.qikan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Yang.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {
        return adminMapper.login(admin);
    }
}

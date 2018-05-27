package com.qikan.service.impl;

import com.qikan.dao.TypeMapper;
import com.qikan.entitys.Type;
import com.qikan.service.TypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Yang.
 */
@Service
public class TypeServiceImpl implements TypeService {
    @Resource
    private TypeMapper typeMapper;

    @Override
    public int deleteByTypeId(Integer typeid) {
        return typeMapper.deleteByTypeId(typeid);
    }

    @Override
    public int addType(Type type) {
        return typeMapper.addType(type);
    }

    @Override
    public Type selectTypeById(Integer typeid) {
        return typeMapper.selectTypeById(typeid);
    }

    @Override
    public List<Type> getAllType() {
        return typeMapper.getAllType();
    }

    @Override
    public int updateByTypeId(Type type) {
        return typeMapper.updateByTypeId(type);
    }
}

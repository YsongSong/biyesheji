package com.qikan.dao;

import com.qikan.entitys.Type;

import java.util.List;

public interface TypeMapper {

    /**
     * 通过id删除类别
     * @param typeid
     * @return
     */
    public int deleteByTypeId(Integer typeid);

    /**
     * 添加类别
     * @param type
     * @return
     */
    public int addType(Type type);

    /**
     * 通过Id查询类别
     * @param typeid
     * @return
     */
    public Type selectTypeById(Integer typeid);

    /**
     * 获取所有的类别
     * @return
     */
    public List<Type> getAllType();

    /**
     * 通过Id修改类别
     * @param type
     * @return
     */
    public int updateByTypeId(Type type);
}
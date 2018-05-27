package com.qikan.dao;

import com.qikan.entitys.Qikan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QikanMapper {

    /**
     * 获取最新的3条期刊
     * @return
     */
    public List<Qikan> getQikanList();

    public int getQikanCount(Integer typeId);

    /**
     * 根据期刊类别来查找数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex(Integer typeId);

    /**
     * 根据期刊类别来查找最新的6条数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex6(Integer typeId);

    /**
     * 根据期刊类别来查找最新的8条数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex8(Integer typeId);

    /**
     * 根据期刊类别来查找最新的10条数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex10(@Param("typeId") Integer typeId, @Param("pc") Integer pc);

    /**
     * 根据id删除期刊
     * @param qikanid
     * @return
     */
    public int deleteByQikanId(Integer qikanid);

    /**
     *  添加期刊
     * @param record
     * @return
     */
    public int addQikan(Qikan record);


    /**
     * 根据id查询期刊详细信息
     * @param qikanid
     * @return
     */
    public Qikan selectByQikanId(Integer qikanid);


    /**
     * 根据id修改期刊内容
     * @param record
     * @return
     */
    public int updateByQikanId(Qikan record);
}
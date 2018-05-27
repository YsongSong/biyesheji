package com.qikan.service;

import com.qikan.entitys.Qikan;

import java.util.List;

/**
 * 期刊接口
 * Created by Yang.
 */
public interface QikanService {
    /**
     * 获取最新的3条期刊
     * @return
     */
    public List<Qikan> getQikanList();

    /**
     * 统计期刊数量
     * @param typeId
     * @return
     */
    public int getQikanCount(Integer typeId);

    /**
     * 根据期刊类别来查找数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex(Integer typeId);

    /**
     * 根据期刊类别来查找最新的10条数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex10(Integer typeId, Integer pc);

    /**
     * 根据期刊类别来查找最新的8条数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex8(Integer typeId);

    /**
     * 根据期刊类别来查找最新的6条数据
     * @param typeId
     * @return
     */
    public List<Qikan> getIndex6(Integer typeId);

    /**
     * 根据id删除期刊
     * @param qikanid
     * @return
     */
    public int deleteByQikanId(Integer qikanid);

    /**
     *  添加期刊
     * @param qikan
     * @return
     */
    public int addQikan(Qikan qikan);


    /**
     * 根据id查询期刊详细信息
     * @param qikanid
     * @return
     */
    public Qikan selectByQikanId(Integer qikanid);


    /**
     * 根据id修改期刊内容
     * @param qikan
     * @return
     */
    public int updateByQikanId(Qikan qikan);

}

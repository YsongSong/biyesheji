package com.qikan.service;

import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.CheckDto;
import com.qikan.entitys.CheckUp;
import com.qikan.entitys.CheckUpWithBLOBs;

import java.util.List;

/**
 * 审稿记录业务层
 * Created by Yang.
 */
public interface CheckUpService {

    /**
     * 查询已分派稿件(分派专家未递交主编)
     * @param checkDto
     * @return
     */
    public List<CheckUpWithBLOBs> getSend(CheckDto checkDto);

    /**
     * 查询专家未审核稿件
     * @param checkDto
     * @return
     */
    public List<CheckUpWithBLOBs> getExpertUnCheck(CheckDto checkDto);

    /**
     * 查询专家已审核稿件
     * @param checkDto
     * @return
     */
    public List<CheckUpWithBLOBs> getExpertCheck(CheckDto checkDto);

    /**
     * 查询主编未审核稿件
     * @param checkDto
     * @return
     */
    public List<CheckUpWithBLOBs> getAdminUnRead(CheckDto checkDto);

    /**
     * 查询主编已审核稿件
     * @param checkDto
     * @return
     */
    public List<CheckUpWithBLOBs> getAdminRead(CheckDto checkDto);


    /**
     * 按编号删除
     * @param cheekid
     * @return
     */
    int deleteByPrimaryKey(Integer cheekid);

    /**
     * 登记审稿记录(字段齐全)
     * @param checkUpWithBLOBs
     * @return
     */
    int insert(CheckUpWithBLOBs checkUpWithBLOBs);

    /**
     * 登记审稿记录(按需插入)
     * @param checkUpWithBLOBs
     * @return
     */
    int insertSelective(CheckUpWithBLOBs checkUpWithBLOBs);

    /**
     * 按编号查询
     * @param cheekid
     * @return
     */
    CheckUpWithBLOBs selectByPrimaryKey(Integer cheekid);

    /**
     * 按编稿件编号
     * @param aticleId
     * @return
     */
    CheckUpWithBLOBs selectByArticleId(Integer aticleId);

    /**
     * 更新记录(按需)
     * @param checkUpWithBLOBs
     * @return
     */
    int updateByPrimaryKeySelective(CheckUpWithBLOBs checkUpWithBLOBs);

    /**
     * 更新(字段齐全)
     * @param checkUpWithBLOBs
     * @return
     */
    int updateByPrimaryKeyWithBLOBs(CheckUpWithBLOBs checkUpWithBLOBs);

    /**
     * 按编号修改
     * @param checkUp
     * @return
     */
    int updateByPrimaryKey(CheckUp checkUp);

    /**
     * 分派专家
     * @param checkUpWithBLOBs
     * @param articleInfo
     * @return
     */
    public Boolean sendExpert(CheckUpWithBLOBs checkUpWithBLOBs, ArticleInfo articleInfo);
}

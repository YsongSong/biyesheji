package com.qikan.dao;

import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.UserInfo;
import com.qikan.entitys.UserInfoDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleInfoMapper {

    /**
     * 按Id删除稿件
     * @param articleid
     * @return
     */
    int deleteByArticleId(Integer articleid);

    /**
     * 添加稿件
     * @param record
     * @return
     */
    int insert(ArticleInfo record);

    /**
     * 添加稿件 一些字段可为空
     * @param articleInfo
     * @return
     */
    int insertSelective(ArticleInfo articleInfo);

    /**
     * 查找退稿稿件
     * @return
     */
    List<ArticleInfo> getTuiGao(UserInfoDto userInfoDto);

    /**
     * 查找所有未审核稿件
     * @param pc  当前页数
     * @param ps  没页记录数
     * @return
     */
    List<ArticleInfo> getUnSendArticle(@Param("pc") Integer pc, @Param("ps") Integer ps);

    /**
     * 查找所有已审核稿件
     * @param pc  当前页数
     * @param ps  没页记录数
     * @return
     */
    List<ArticleInfo> getSendArticle(@Param("pc") Integer pc, @Param("ps") Integer ps);



    /**
     * 通过稿件编号查找稿件信息
     * @param articleid
     * @return
     */
    ArticleInfo selectByArticleId(Integer articleid);

    /**
     * 通过用户Id查找未发表稿件
     * @return
     */
    List<ArticleInfo> getUnPublishArticle(UserInfoDto userInfoDto);

    /**
     * 通过用户Id查找已发表稿件
     * @return
     */
    List<ArticleInfo> getPublishArticle(UserInfoDto userInfoDto);

    /**
     * 通过用户Id查找未审核稿件
     * @return
     */
    List<ArticleInfo> getUnCheckArticle(UserInfoDto userInfoDto);

    /**
     * 通过用户Id查找已审核稿件
     * @return
     */
    List<ArticleInfo> getCheckArticle(UserInfoDto userInfoDto);

    /**
     * 按编号id修改稿件(字段可为空)
     * @param articleInfo
     * @return
     */
    int updateByArticleIdSelective(ArticleInfo articleInfo);

    /**
     *
     * @param articleInfo
     * @return
     */
    int updateByArticleIdKey(ArticleInfo articleInfo);
}
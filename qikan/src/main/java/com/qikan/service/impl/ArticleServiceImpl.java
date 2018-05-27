package com.qikan.service.impl;

import com.qikan.dao.ArticleInfoMapper;
import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.UserInfo;
import com.qikan.entitys.UserInfoDto;
import com.qikan.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Yang.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    @Override
    public int deleteByArticleId(Integer articleid) {
        return articleInfoMapper.deleteByArticleId(articleid);
    }

    @Override
    public int insert(ArticleInfo articleInfo) {
        return articleInfoMapper.insert(articleInfo);
    }

    @Override
    public int insertSelective(ArticleInfo articleInfo) {
        return articleInfoMapper.insertSelective(articleInfo);
    }

    @Override
    public List<ArticleInfo> getTuiGao(UserInfoDto userInfoDto) {
        return articleInfoMapper.getTuiGao(userInfoDto);
    }

    @Override
    public List<ArticleInfo> getUnSendArticle(Integer pc, Integer ps) {
        return articleInfoMapper.getUnSendArticle(pc, ps);
    }

    @Override
    public List<ArticleInfo> getSendArticle(Integer pc, Integer ps) {
        return articleInfoMapper.getSendArticle(pc, ps);
    }


    @Override
    public ArticleInfo selectByArticleId(Integer articleid) {
        return articleInfoMapper.selectByArticleId(articleid);
    }

    @Override
    public List<ArticleInfo> getUnPublishArticle(UserInfoDto userInfoDto) {
        return articleInfoMapper.getUnPublishArticle(userInfoDto);
    }

    @Override
    public List<ArticleInfo> getPublishArticle(UserInfoDto userInfoDto) {
        return articleInfoMapper.getPublishArticle(userInfoDto);
    }

    @Override
    public List<ArticleInfo> getUnCheckArticle(UserInfoDto userInfoDto) {
        return articleInfoMapper.getUnCheckArticle(userInfoDto);
    }

    @Override
    public List<ArticleInfo> getCheckArticle(UserInfoDto userInfoDto) {
        return articleInfoMapper.getCheckArticle(userInfoDto);
    }

    @Override
    public int updateByArticleIdSelective(ArticleInfo articleInfo) {
        return articleInfoMapper.updateByArticleIdSelective(articleInfo);
    }

    @Override
    public int updateByArticleIdKey(ArticleInfo articleInfo) {
        return articleInfoMapper.updateByArticleIdKey(articleInfo);
    }
}

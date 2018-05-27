package com.qikan.service.impl;

import com.qikan.dao.ArticleInfoMapper;
import com.qikan.entitys.ArticleInfo;
import com.qikan.service.AuthorContributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Yang.
 */
@Service
public class AuthorContributeServiceImpl implements AuthorContributeService{
    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    @Override
    public void saveArticle(ArticleInfo articleInfo) {
        articleInfoMapper.insertSelective(articleInfo);
    }
}

package com.qikan.service;

import com.qikan.entitys.ArticleInfo;

/**
 * 作者投稿
 * Created by Yang.
 */
public interface AuthorContributeService {

    /**
     * 保存稿件信息
     */
    public void saveArticle(ArticleInfo articleInfo);

}

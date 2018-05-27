package com.qikan.service.impl;

import com.qikan.dao.ArticleInfoMapper;
import com.qikan.dao.CheckUpMapper;
import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.CheckDto;
import com.qikan.entitys.CheckUp;
import com.qikan.entitys.CheckUpWithBLOBs;
import com.qikan.service.CheckUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Yang.
 */
@Service
public class CheckUpServiceImpl implements CheckUpService {

    @Autowired
    private CheckUpMapper checkUpMapper;
    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    @Override
    public List<CheckUpWithBLOBs> getSend(CheckDto checkDto) {
        return checkUpMapper.getSend(checkDto);
    }

    @Override
    public List<CheckUpWithBLOBs> getExpertUnCheck(CheckDto checkDto) {
        return checkUpMapper.getExpertUnCheck(checkDto);
    }

    @Override
    public List<CheckUpWithBLOBs> getExpertCheck(CheckDto checkDto) {
        return checkUpMapper.getExpertCheck(checkDto);
    }

    @Override
    public List<CheckUpWithBLOBs> getAdminUnRead(CheckDto checkDto) {
        return checkUpMapper.getAdminUnRead(checkDto);
    }

    @Override
    public List<CheckUpWithBLOBs> getAdminRead(CheckDto checkDto) {
        return checkUpMapper.getAdminRead(checkDto);
    }

    @Override
    public int deleteByPrimaryKey(Integer cheekid) {
        return checkUpMapper.deleteByPrimaryKey(cheekid);
    }

    @Override
    public int insert(CheckUpWithBLOBs checkUpWithBLOBs) {
        return checkUpMapper.insert(checkUpWithBLOBs);
    }

    @Override
    public int insertSelective(CheckUpWithBLOBs checkUpWithBLOBs) {
        return checkUpMapper.insertSelective(checkUpWithBLOBs);
    }

    @Override
    public CheckUpWithBLOBs selectByPrimaryKey(Integer cheekid) {
        return checkUpMapper.selectByPrimaryKey(cheekid);
    }

    @Override
    public CheckUpWithBLOBs selectByArticleId(Integer aticleId) {
        return checkUpMapper.selectByArticleId(aticleId);
    }

    @Override
    public int updateByPrimaryKeySelective(CheckUpWithBLOBs checkUpWithBLOBs) {
        return checkUpMapper.updateByPrimaryKeySelective(checkUpWithBLOBs);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(CheckUpWithBLOBs checkUpWithBLOBs) {
        return checkUpMapper.updateByPrimaryKeyWithBLOBs(checkUpWithBLOBs);
    }

    @Override
    public int updateByPrimaryKey(CheckUp checkUp) {
        return checkUpMapper.updateByPrimaryKey(checkUp);
    }

    @Override
    public Boolean sendExpert(CheckUpWithBLOBs checkUpWithBLOBs, ArticleInfo articleInfo) {
        try {
            checkUpMapper.insertSelective(checkUpWithBLOBs);  // 执行插入记录操作
            articleInfoMapper.updateByArticleIdSelective(articleInfo);   // 改变稿件审核状态为审核中
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}

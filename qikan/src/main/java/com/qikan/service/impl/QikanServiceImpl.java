package com.qikan.service.impl;

import com.qikan.dao.QikanMapper;
import com.qikan.entitys.Qikan;
import com.qikan.service.QikanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Yang on 2018/2/26 0026.
 */
@Service
public class QikanServiceImpl implements QikanService {

    @Resource
    private QikanMapper qikanMapper;

    @Override
    public List<Qikan> getQikanList() {
        return qikanMapper.getQikanList();
    }

    public int getQikanCount(Integer typeId){
        return qikanMapper.getQikanCount(typeId);
    }

    @Override
    public List<Qikan> getIndex(Integer typeId) {
        return qikanMapper.getIndex(typeId);
    }

    @Override
    public List<Qikan> getIndex10(Integer typeId, Integer pc) {
        return qikanMapper.getIndex10(typeId, pc);
    }

    @Override
    public List<Qikan> getIndex8(Integer typeId) {
        return qikanMapper.getIndex8(typeId);
    }

    @Override
    public List<Qikan> getIndex6(Integer typeId) {
        return qikanMapper.getIndex6(typeId);
    }

    @Override
    public int deleteByQikanId(Integer qikanid) {
        return qikanMapper.deleteByQikanId(qikanid);
    }

    @Override
    public int addQikan(Qikan qikan) {
        return qikanMapper.addQikan(qikan);
    }

    @Override
    public Qikan selectByQikanId(Integer qikanid) {
        return qikanMapper.selectByQikanId(qikanid);
    }

    @Override
    public int updateByQikanId(Qikan qikan) {
        return qikanMapper.updateByQikanId(qikan);
    }
}

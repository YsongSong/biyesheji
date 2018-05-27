package com.qikan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.qikan.dao.NoticeMapper;
import com.qikan.entitys.Notice;
import com.qikan.entitys.NoticeWithBLOBs;
import com.qikan.service.NoticeService;
import org.springframework.stereotype.Service;


/**
 * 帖子Service实现类
 * @author user
 *
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public int deleteByNoticeId(Integer noticeid) {
        return noticeMapper.deleteByNoticeId(noticeid);
    }

    @Override
    public int insert(NoticeWithBLOBs notice) {
        return noticeMapper.insert(notice);
    }

    public List<Notice> getNoticeListByTypeId(Integer noticeId){
        return noticeMapper.getNoticeListByTypeId(noticeId);
    }

    @Override
    public NoticeWithBLOBs selectByNoticeId(Integer noticeid) {
        return noticeMapper.selectByNoticeId(noticeid);
    }

    @Override
    public List<Notice> query() {
        return noticeMapper.query();
    }

    @Override
    public int updateByNoticeId(NoticeWithBLOBs notice) {
        return noticeMapper.updateByNoticeId(notice);
    }
}

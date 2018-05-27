package com.qikan.service;

import com.qikan.entitys.Notice;
import com.qikan.entitys.NoticeWithBLOBs;

import java.util.List;
import java.util.Map;


/**
 * 通知Service接口
 * @author user
 *
 */
public interface NoticeService {

    /**
     * 通过Id删除通告
     * @param noticeid
     * @return
     */
    int deleteByNoticeId(Integer noticeid);

    /**
     * 插入通告
     * @param notice
     * @return
     */
    int insert(NoticeWithBLOBs notice);

    /**
     * 通过类别Id查询10条通告
     * @return
     */
    public List<Notice> getNoticeListByTypeId(Integer noticeId);

    /**
     * 通过Id查询通告
     * @param noticeid
     * @return
     */
    NoticeWithBLOBs selectByNoticeId(Integer noticeid);

    /**
     * 通告查询
     * @return
     */
    List<Notice> query();

    /**
     * 按id修改
     * @param notice
     * @return
     */
    int updateByNoticeId(NoticeWithBLOBs notice);
}

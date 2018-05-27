package com.qikan.controller;

import com.qikan.entitys.Qikan;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.Type;
import com.qikan.service.QikanService;
import com.qikan.service.TypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Yang.
 */
@Controller
@RequestMapping("getqikan")
public class QikanController {
    private static final Logger logger = LoggerFactory.getLogger(QikanController.class);
    @Autowired
    private QikanService qikanService;

    /**
     * select菜单二级联动使用
     * @return
     */
    @RequestMapping(value = "/getTypeByTypeId")
    @ResponseBody
    public ReturnResponse getQikanByTypeId(Integer typeId) {
        List<Qikan> qikanList = qikanService.getIndex(typeId);
        ReturnResponse<List<Qikan>> response = new ReturnResponse<>(0, "类别为"+typeId+"的所有期刊数据", qikanList);
        return response;
    }
}

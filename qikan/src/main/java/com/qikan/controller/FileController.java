package com.qikan.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.service.FilePreview;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 文章保存位置=基础路径/+作者Id/xxx.doc)
 * Created by Yang on 2018/2/25 0025.
 */
@Controller
public class FileController {
    @Resource
    FilePreview filePreview;
    @Value("${file.dir}")
    String fileDir;


    /**
     * 文件下载
     * @param request
     * @param filename
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/download", method= {RequestMethod.POST,RequestMethod.GET})
    public ResponseEntity<byte[]> download(HttpServletRequest request,
                                           @RequestParam("filename") String filename,
                                           Integer authorId)throws Exception {
        System.out.println(filename);

        //下载文件路径
        String path = fileDir + authorId + "\\";
        File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //通知浏览器以attachment（下载方式）
        headers.setContentDispositionFormData("attachment", downloadFielName);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "onlinePreview", method = RequestMethod.GET)
    public void onlinePreview(String url, String userId, HttpServletResponse response) throws Exception {
        System.out.println("预览文件" + url);
        String pdf = filePreview.filePreviewHandle(url, userId);
        getCorsFile(pdf,response);
    }

    /**
     * 根据url获取文件内容
     * 当pdfjs读取存在跨域问题的文件时将通过此接口读取
     *
     * @param urlPath
     * @param response
     */
    public void getCorsFile(String urlPath, HttpServletResponse response) throws Exception {
        System.out.println(urlPath);
        response.setContentType("application/pdf");
        FileInputStream in = new FileInputStream(new File(urlPath));
        OutputStream out = response.getOutputStream();
        byte[] b = new byte[512];
        while ((in.read(b))!=-1) {
            out.write(b);
        }
        out.flush();
        in.close();
        out.close();
    }

}

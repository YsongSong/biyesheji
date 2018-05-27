package com.qikan.service.impl;

import com.qikan.entitys.FileAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import com.qikan.service.FilePreview;
import com.qikan.util.DownloadUtils;
import com.qikan.util.FileUtils;
import com.qikan.util.OfficeToPdf;

import java.io.File;

/**
 * Created by kl on 2018/1/17. Content :处理office文件
 */
@Service
public class OfficeFilePreviewImpl implements FilePreview {

    @Autowired
    FileUtils fileUtils;

    @Value("${file.dir}")
    String fileDir;

    @Autowired
    DownloadUtils downloadUtils;

    @Autowired
    private OfficeToPdf officeToPdf;

    @Override
    public String filePreviewHandle(String url, String userId) {
        String userfile = fileDir + userId + "\\";
        FileAttribute fileAttribute=fileUtils.getFileAttribute(url);
        System.out.println(fileAttribute);
        String fileName=fileAttribute.getName();
        String pdfName = fileName.substring(0, fileName.lastIndexOf(".") + 1) + ("pdf");
        String pdfFilePath = userfile + "pdf\\" + pdfName;
        System.out.println(pdfFilePath);
        // 判断之前是否已转换过，如果转换过，直接返回，否则执行转换
        if (!fileUtils.existsFile(pdfName, userfile)) {
            String filePath = userfile + fileName;
            if (StringUtils.hasText(pdfFilePath)) {
                officeToPdf.openOfficeToPDF(filePath, pdfFilePath);
                File f = new File(filePath);
            }
        }
        return pdfFilePath;
    }
}


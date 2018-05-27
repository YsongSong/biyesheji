package com.qikan.util;

import com.qikan.entitys.FileAttribute;
import com.qikan.entitys.FileType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yudian-it
 * @date 2017/11/13
 */
@Component
public class FileUtils {
    Logger log= LoggerFactory.getLogger(getClass());

  
    @Value("${file.dir}")
    String fileDir;

    
    /**
     * 是否存在该文件
     * @return
     * @param fileName
     */
	public boolean existsFile(String fileName, String path) {
        boolean result = false;
        File file = new File(path);
        if (file.exists()) {
            for(File file1 : file.listFiles()){
                String name = file1.getName();	//文件名 服务器中
                if (fileName.equals(name)) {
                    result = true;
                    break;
                }
            }
        }
        return result;
    }

    /**
     * 从url中剥离出文件名
     * @param url
     *      格式如：http://keking.ufile.ucloud.com.cn/20171113164107_月度绩效表模板(新).xls?UCloudPublicKey=ucloudtangshd@weifenf.com14355492830001993909323&Expires=&Signature=I D1NOFtAJSPT16E6imv6JWuq0k=
     * @return
     */
    public String getFileNameFromURL(String url) {
        // 因为url的参数中可能会存在/的情况，所以直接url.lastIndexOf("/")会有问题
        // 所以先从？处将url截断，然后运用url.lastIndexOf("/")获取文件名
        String noQueryUrl = url.substring(0, url.indexOf("?") != -1 ? url.indexOf("?"): url.length());
        String fileName = noQueryUrl.substring(noQueryUrl.lastIndexOf("/") + 1);
        return fileName;
    }

    /**
     * 获取文件后缀
     * @param fileName
     * @return
     */
    public String getSuffixFromFileName(String fileName) {
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        return suffix;
    }

    /**
     * 从路径中获取
     * @param path
     *      类似这种：C:\Users\yudian-it\Downloads
     * @return
     */
    public String getFileNameFromPath(String path) {
        return path.substring(path.lastIndexOf(File.separator) + 1);
    }
    
    public List<String> listOfficeTypes() {
        List<String> list = new ArrayList<>();
        list.add("docx");
        list.add("doc");
        list.add("xls");
        list.add("xlsx");
        list.add("ppt");
        list.add("pptx");
        return list;
    }

    /**
     * 获取相对路径
     * @param absolutePath
     * @return
     */
    public String getRelativePath(String absolutePath) {
        return absolutePath.substring(fileDir.length());
    }


    /**
     * 获取文件后缀
     * @param url
     * @return
     */
    private String suffixFromUrl(String url) {
        String nonPramStr = url.substring(0, url.indexOf("?") != -1 ? url.indexOf("?") : url.length());
        String fileName = nonPramStr.substring(nonPramStr.lastIndexOf("/") + 1);
        String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
        return fileType;
    }

    public FileAttribute getFileAttribute(String url) {
        String decodedUrl=null;
        try {
            decodedUrl = URLDecoder.decode(url, "utf-8");
        }catch (UnsupportedEncodingException e){
            log.debug("url解码失败");
        }
        // 路径转码
        FileType type = typeFromUrl(url);
        String suffix = suffixFromUrl(url);
        // 抽取文件并返回文件列表
        String fileName = getFileNameFromURL(decodedUrl);
        return new FileAttribute(type,suffix,fileName,url,decodedUrl);
    }
    
    public FileType typeFromUrl(String url) {
    	 String nonPramStr = url.substring(0, url.indexOf("?") != -1 ? url.indexOf("?") : url.length());
         String fileName = nonPramStr.substring(nonPramStr.lastIndexOf("/") + 1);
         String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
    	if (listOfficeTypes().contains(fileType.toLowerCase())) {
            return FileType.office;
        }
		return FileType.other;
    }
}

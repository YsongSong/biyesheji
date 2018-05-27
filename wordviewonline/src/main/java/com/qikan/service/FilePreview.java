package com.qikan.service;

/**
 * Created by Yang on 2018/1/17.
 * Content :
 */
public interface FilePreview {
    /**
     * 传入源文件地址，以及用户id
     * 返回转换后的文件路径(pdf)
     * @param url
     * @return
     */
    public String filePreviewHandle(String url, String userId);
}

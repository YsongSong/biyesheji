package com.qikan.util;


import org.springframework.web.multipart.MultipartFile;

import java.io.*;


/**
 *文件工具
 * Created by Yang.
 */
public class FileUtil {

    /**
     * 文件上传
     * @param file
     * @param filePath
     * @param outPath
     * @return
     */
    public static boolean fileUpload(MultipartFile file, String filePath, String outPath) {
        File outFile = new File(outPath);
        //输出路径不存则这创建
        if (!outFile.exists()) {
            outFile.mkdirs();
        }
        try(InputStream in = file.getInputStream();
            OutputStream ot = new FileOutputStream(filePath)){
            byte[] buffer = new byte[1024];
            int len;
            while ((-1 != (len = in.read(buffer)))) {
                ot.write(buffer, 0, len);
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }


    /**
     * 文件是否存在
     * @param filePath
     * @return
     */
    public static boolean fileExists(String filePath) {
        if (!new File(filePath).exists()) {
            return false;
        } else {
            return true;
        }
    }
}

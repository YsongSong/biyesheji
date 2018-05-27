<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传</title>
</head>
<body>
<h2>文件上传</h2>
<form action="/upload.do" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>name:</td>
            <td><input type="text" name="name" style="width: 400px" /></td>
        </tr>
        <tr>
            <td>content:</td>
            <td><input type="text" name="content" style="width: 400px" /></td>
        </tr>
        <tr>
            <td>请选择文件:</td>
            <td><input type="file" name="file"></td>
        </tr>
        <tr>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
</form>

<a href="download.do?filename=稿件剩余工作.txt">下载</a>
</body>
</html>
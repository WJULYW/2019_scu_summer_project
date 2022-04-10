<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>添加分类</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <style>
    	.msg{
    		text-align:center;
    		margin-top:10px;
    	}
    </style>
</head>
<body>
       <div class="result-wrap">
           <div class="result-content">
               <form action="AddKindServlet" method="post">
                   <table class="insert-tab" width="100%">
                       <tbody><tr>
                           <th width="120"><i class="require-red">*</i>分类名称：</th>
                           <td>
                               <input class="common-text required" required id="title" name="kname" size="50" value="" type="text">
                           </td>
                       </tr>
                           <tr>
                               <th></th>
                               <td>
                                   <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                   <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                               </td>
                           </tr>
                           
                       </tbody>
                    </table>
               </form>                
           </div>
           
       </div>
</body>
</html>
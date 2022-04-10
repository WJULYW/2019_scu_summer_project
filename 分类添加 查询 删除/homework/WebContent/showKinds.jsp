<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!doctype html>
<!--显示用户-->
<html>
<head>
    <meta charset="UTF-8">
    <title>显示所有分类信息</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body>
        <div class="search-wrap">
            <div class="search-content">
                <form action="SearchKindsByKname" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">分类查询:</th>
                            <td><input class="common-text" name="kname" placeholder="关键字" name="keywords" type="text"></td>
                            <td><input class="btn btn-primary btn2" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
                <div class="result-content">                    
	                    <table class="result-tab" width="100%">
	                        <tr>
	                            <th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
	                            <th>分类编号</th>
	                            <th>分类名称</th>
	                            <th>操作</th>
	                        </tr>
	                        <c:forEach var="kind" items="${sessionScope.kindsList }">
	                        <tr>
	                            <td class="tc"><input name="id[]" value="59" type="checkbox"></td>
	                            <td>${kind.kid }</td>
	                            <td>${kind.kname }</td>
	                            <td>
	                                <a class="link-update" href="#" onclick="if(confirm('确定要删除吗？')){window.location.href='DelKindServlet?kid=${kind.kid}'}" >删除</a>
	                            </td>
	                        </tr>
	                        </c:forEach>
	                    </table>
	                    <div class="list-page"> 2 条 1/1 页</div>                    
                </div>           
        </div> 
</body>

</body>
</html>
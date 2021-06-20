<%-- 
    Document   : left
    Created on : May 17, 2021, 10:51:48 PM
    Author     : Kien Nguyen
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Right</title>
        <link href="css/right.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="right">
            <div class="newst">
                <div class="titleNews">
                    <span>Digital News</span>
                </div>
                <div class="contentNews">
                    ${top1.content.substring(0,250)}
                </div>
            </div>
            <div class="newst">
                <div class="titleNews">
                    Search
                </div>
                <form action="search" method="post">
                    <input class="searchBox" type="text" name="txtSearch" size="15" value="${txt}"  required>
                    <input class="searchButton" type="submit" name="btnGo" value="Go">
                </form>                        
            </div>
            <div class="newst">
                <div class="titleNews">
                    <span>Last Articles</span><br>
                </div>   
                    <c:forEach items="${top5}" var="i">
                        <div class="lastArticles">
                            <a href="detail?id=${i.id}">${i.title}</a>
                        </div>
                    </c:forEach>
                </div>
        </div>    
    </body>
</html>

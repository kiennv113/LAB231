<%-- 
    Document   : SearchResult
    Created on : May 23, 2021, 11:33:08 PM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <div class="container">
        <jsp:include page="Header.jsp"/>
        <div class="content">
            <div class="main">                           
                <c:forEach items="${list}" var="x">
                    <div class="tittle">
                        <a href="detail?id=${x.id}">      
                            ${x.title}
                        </a>
                    </div>
                    <div class="image_search">
                        <img src="${x.image}" alt=""/>
                    </div>
                    <div class="text_search">
                        ${x.content.substring(0,250)}
                    </div>
                    <br>
                </c:forEach>
                <div class="paging">
                    <c:if test="${maxPage==0}">
                        <h3>No Result</h3>
                    </c:if>
                    <c:if test="${maxPage>1}">
                        <c:forEach begin="1" end="${maxPage}" var="i">
                            <a class="${i==index?"active":""}" href="search?index=${i}&txtSearch=${txt}">${i}</a>
                        </c:forEach>
                    </c:if>
                </div>
            </div> 
            <jsp:include page="Right.jsp"/> 
        </div>
        <jsp:include page="Footer.jsp"/>
    </div>

</body>
</html>

<%-- 
    Document   : ViewListHome
    Created on : Jun 9, 2021, 11:34:43 AM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>      
            <div id="main-content">
            <jsp:include page="Left.jsp"></jsp:include>      
                <div id="main-panel" style="position: absolute"> 
                       <p id="big-blue"> Request received by ${choice==1?"today":"last 2 days"} of ${dname} </p>    
                    <table>
                        <tr>
                            <th>Request title</th>
                            <th style="width: 150px">Date created</th>
                            <th style="width: 150px">Close created</th>
                            <th>Status</th>
                            <th>Report to</th>
                            <th>Detail</th>
                        </tr>
                    <c:forEach items="${listHome}" var="r">
                        <tr>
                            <td id="rtitle" style="color: green">${r.title}</td>
                            <td>${r.date}</td>
                            <td>${r.closeDate==null?"N/A":r.closeDate}</td>
                            <td>${r.status==0?"in progess":(r.status==1?"approved":"reject")}</td>
                            <td> ${dname}</td>
                            <td><a href="detail?id=${r.requestId}">${r.status==0?"Solve":"View"}</a></td>
                        </tr>
                    </c:forEach>                           
                </table>
                    <br/>
                    <button><a href="home"> Back </a></button>
            </div>
        </div>
    </body>
</html>

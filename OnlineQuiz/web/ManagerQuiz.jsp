<%-- 
   Document   : ManageQuiz
   Created on : May 30, 2021, 9:00:20 PM
   Author     : Kien Nguyen
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Quiz</title>
        <link rel="stylesheet" href="css/style.css"> 
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="Header.jsp"></jsp:include>
                <div id="main-content">   
                    <h3>Number of question: <span class="blue"> ${total}</span></h3>
                <table >
                    <colgroup>
                        <col class="labelCol">
                        <col class="fieldCol">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>Question</th>
                            <th>Date Created</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="q" items="${listQ}">
                            <tr>
                                <td>${q.question}</td>
                                <td>${q.date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <ul id="pageList">

                </ul>
            </div>
        </div>

    </body>
</html>

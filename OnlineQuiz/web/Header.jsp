<%-- 
    Document   : Header
    Created on : May 26, 2021, 11:50:51 AM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Header</title>
    </head>
    <body>
        <div id="nav-bar">
            <a href='home'>Home</a>
            <a href="home">Take Quiz</a>
            <c:if test="${sessionScope.a.type}">
                <a href='MakeQuiz.jsp'>Make Quiz</a>
                <a href='manager'>Manage Quiz</a>
            </c:if>
            <c:if test="${sessionScope.a==null}">
                <a>Make Quiz</a>
                <a>Manage Quiz</a>
            </c:if>
            <a href="logout">Logout</a>
        </div>
    </body>
</html>

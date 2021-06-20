<%-- 
    Document   : Home
    Created on : May 25, 2021, 9:07:23 AM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Online Quiz</title>
    </head>
    <body>

        <div id="main-panel">
            <jsp:include page="Header.jsp"></jsp:include>
             <jsp:include page="TakeQuiz.jsp"></jsp:include>
        </div>
    </body>
</html>

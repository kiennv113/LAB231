<%-- 
    Document   : GetQuiz
    Created on : May 28, 2021, 5:26:42 PM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Take Quiz Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.a == null}">
            <div id="main-content">     
                <jsp:include page="Login.jsp"></jsp:include>
                </div>
        </c:if>
        <c:if test="${sessionScope.a != null}">
            <div id="main-content">     
                Welcome <span class="blue">${sessionScope.a.username} </span><br/>
                <form action="takequiz" method="post">
                    <br/>  Enter number of question: <br/>
                    <input type="number" min="1" name="numOfQuiz" class="numOfQuiz" required> <br/>
                    <input type="submit" value="Start" class="start">
                </form>
                <a class="failed"> ${mess} </a>
            </div>                   
        </c:if>
    </body>
</html>

<%-- 
    Document   : Login
    Created on : Jun 5, 2021, 11:37:02 PM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <c:if test="${sessionScope.a == null}">
            <p id="big-blue">Member Login</p>
            <p>Using your username and password</p>     
            <form action="login" method="post" id="form">
                <label>Username </label><input type="text" name="user" required><span id="red">(*)</span><br/><br/>
                <label>Password </label><input type="password" name="pass" required><span id="red">(*)</span><br/>
                <br>
                <button type="submit">Log In</button><br>
                <p>The field <span id="red">(*)</span> is required </p>     
                <p id="failed">${mess}</p>
        </form>  
    </c:if>
</body>
</html>

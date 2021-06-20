<%-- 
    Document   : Right
    Created on : Jun 1, 2021, 11:12:14 PM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    long millis = System.currentTimeMillis();
    java.util.Date date = new java.util.Date(millis);
    DateFormat df = new SimpleDateFormat("E dd/MM/yyyy", Locale.US);
    String nowdate = df.format(date);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>   
        <div id="left">
            <ul>    
                <li> 
                    <c:if test="${sessionScope.a == null}">
                        <form action="login">
                            <input class="btn" type="submit" value="Login">
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.a != null}">
                        <form action="logout">
                            <input class="btn" type="submit" value="Welcome ${sessionScope.a.username}, Logout">
                        </form>
                    </c:if>
                </li>
                <br>
                <li> 
                    <form action="home">
                        <input class="btn" type="submit" value="Home">
                    </form>
                </li>
                <br>
                <li>
                    <c:if test="${sessionScope.a == null}">
                        <form action="login">
                            <input class="btn" type="submit" value="View requests">
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.a != null}">
                        <form action="view">
                            <input class="btn" type="submit" value="View requests">
                        </form>
                    </c:if>
                </li>
                <br>
                <li>
                    <c:if test="${sessionScope.a == null}">
   
                            <input class="btn" type="submit" value="Solve requests">
              
                    </c:if>
                    <c:if test="${sessionScope.a != null}">
                     
                            <input class="btn" type="submit" value="Solve requests">
                 
                    </c:if>

                </li>
                <br>
                <li>
                    <button id="btn-blue">Today is <%=nowdate%></button></li>
            </ul>
        </div>
    </body>
</html>

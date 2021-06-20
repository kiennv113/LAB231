<%-- 
    Document   : Detail
    Created on : May 23, 2021, 11:22:19 PM
    Author     : Kien Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/style.css" rel="stylesheet" type="text/css" />
        <title>Home Page</title>
    </head>
    <body> 
            <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="content">
                <div class="main">
                    <div class="tittle">
                        ${one.title}
                    </div>
                    <div class="image">
                        <img src="${one.image}"/>
                    </div>
                    <div class="text">
                        ${one.content}
                    </div>
                    <div class="signature">
                        <div class="icon1"></div>
                        <div class="icon2"></div>
                       By ${one.author} | ${one.getDateFormat()}
                    </div>
                </div>
                <jsp:include page="Right.jsp"/> 
            </div>
            <jsp:include page="Footer.jsp"/>
        </div>
    </body>
</html>

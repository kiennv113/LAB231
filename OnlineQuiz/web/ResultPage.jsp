<%-- 
    Document   : ResultPage
    Created on : Jun 1, 2021, 7:43:49 AM
    Author     : Kien Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <div id="main-panel">
            <jsp:include page="Header.jsp"></jsp:include>
            <div id="quizContainer">
                <p>Your score: <span class="blue">  ${result} (${percent}%) - ${status} </span></p>
                
                <form action="home" method="post">
                <input type="hidden" name="req" value="quizReq">
                <input id="resultText" type="hidden" name="numOfQuiz" value="">
                <br>Take another quiz 
                <input type="submit" value="Start" >
            </form>
            </div>
        </div>
    </body>
</html>

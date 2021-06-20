<%-- 
    Document   : QuizPage
    Created on : May 28, 2021, 5:14:01 PM
    Author     : Kien Nguyen
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Quiz"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Quiz> questions = (List<Quiz>) request.getAttribute("test");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>

        <title>Quiz Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="Header.jsp"></jsp:include>
                <div id="quizContainer">         
                    Welcome <span class="blue">${sessionScope.a.username} </span><br/>
                <h4 id="TimeSpan">Time remaining: <span id="timeDisplay">00:00</span></h4>
                <h5 id="questionPos">Question: 0/0</h5>
                <form action="result" method="post">
                    <input type="hidden" name="req" value="quizResult">
                    <input type="hidden" name="numOfQuiz" value="<%=questions.size()%>">
                    <%
                        for (int i = 0; i < questions.size(); i++) {
                            Quiz q = questions.get(i);
                    %>
                    <div id="q<%=i%>" class="hidden">
                        <input type="hidden" name="q<%=i%>" value="<%=q.getId()%>">
                        <p><%=q.getQuestion()%></p>
                        <ul>
                            <input type="checkbox" name="ans<%=i%>-1"><li><%=q.getOp1()%></li> <br>
                            <input type="checkbox" name="ans<%=i%>-2"><li><%=q.getOp2()%></li> <br>
                            <input type="checkbox" name="ans<%=i%>-3"><li><%=q.getOp3()%></li> <br>
                            <input type="checkbox" name="ans<%=i%>-4"><li><%=q.getOp4()%></li> <br>                       
                        </ul>
                    </div>                                                                   
                    <%  }%>
                    <div class="right" style="text-align: right">
                    <button id="bt-previous" type="button" onclick="nextQuestion(-1)" hidden>Previous</button>                   
                    <button id="bt-next" type="button" onclick="nextQuestion(1)" hidden>Next</button>
                    <input type="submit" value="Finish" id="finish" hidden> 
                    </div>
                </form>  
            </div>
        </div>
        <script>
            setNumOfQuiz(${size});
            quizStart();
        </script>
    </body>
</html>

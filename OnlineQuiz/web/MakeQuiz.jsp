<%-- 
    Document   : MakeQuiz
    Created on : May 30, 2021, 8:53:12 PM
    Author     : Kien Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Make Quiz</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="Header.jsp"></jsp:include>
                <form action="makequiz" method="post">
                    <table>
                        <tbody>
                            <tr>
                                <td>Question: </td>
                                <td><textarea id="content" name="question" required>${question}</textarea></td>
                            </tr>
                            <tr>
                                <td>Option 1</td>
                                <td><textarea name="op1" required>${op1}</textarea></td>
                            </tr>
                            <tr>
                                <td>Option 2</td>
                                <td><textarea name="op2" required>${op2}</textarea></td>
                            </tr>
                            <tr>
                                <td>Option 3</td>
                                <td><textarea name="op3" required>${op3}</textarea></td>
                            </tr>
                            <tr>
                                <td>Option 4</td>
                                <td><textarea name="op4"required>${op4}</textarea></td>
                            </tr>
                            <tr>
                                <td>Answer(s)</td>
                                <td>
                                    <input type="checkbox" name="op" value="1"> Option 1
                                    <input type="checkbox" name="op" value="2"> Option 2
                                    <input type="checkbox" name="op" value="3"> Option 3
                                    <input type="checkbox" name="op" value="4"> Option 4
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Save"></td>
                            </tr>
                        </tbody>
                    </table>
                    <h3 class="failed">${mess}</h3>
            </form>
        </div>
    </body>
</html>

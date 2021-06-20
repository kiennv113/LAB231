<%-- 
    Document   : SolveRequest
    Created on : Jun 4, 2021, 8:55:01 AM
    Author     : Kien Nguyen
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.RequestDAO"%>
<%@page import="dal.UserDAO"%>
<%@page import="dal.DepartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>      
            <div id="main-content">
            <jsp:include page="Left.jsp"></jsp:include>      
                <div id="main-panel2" >

                    <form action="solve" method="post">
                        <input type ="text" value="${req.requestId}" name="rid" hidden="">
                    <input type ="text" value="${txtSearch}" name="txtSearch" hidden="">
                    <p id="big-blue"> Request ID ${req.requestId} </td>
                    <table id="solvetbl">   
                        <tr>
                            <td>Request to department</td>
                            <td><input id="fixed" name="depart" type="text" value="${dpname}" readonly></td>
                        </tr>
                        <tr>
                            <td>Student Id</td>
                            <td><input id="fixed" type="text" value="${req.studentId}" readonly></td>
                        </tr>
                        <tr>
                            <td>Student Name</td>
                            <td><input id="fixed" type="text" value="${sname}" readonly></td>
                        </tr>
                        <tr>
                            <td>Date Created</td>
                            <td><input id="fixed" type="text" value="${req.getDate().toString().substring(0, 10)}" readonly></td>
                        </tr>
                        <tr>
                            <td>Request title</td>
                            <td><input id="fixed" type="text" value="${req.title}" readonly ></td>
                        </tr>
                        <tr>
                            <td>Request content</td>
                            <td><textarea style="height: 100px; resize: none" id="fixed"  type="text" value="" readonly> ${req.content}</textarea></td>
                        </tr>

                        <c:if test="${req.status==0}">
                            <tr>
                                <td>Request State</td>
                                <td><input type="radio" name ="status" value="1" required> <label id="blue">Approved</label>
                                    <input type="radio" name ="status" value="-1"> <label id="failed">Rejected</label>
                                </td>
                            </tr>          
                            <tr>
                                <td>Date Closed</td>
                                <td><input type=date style="width: 150px" name="closeDate" required></td>
                            </tr>
                            <tr>
                                <td>Solved by </td>
                                <td><input  id="fixed" type="text" value="${sessionScope.a.username}" readonly > </td>
                            </tr>
                            <tr>
                                <td>Attach (if any)</td>
                                <td><button>Download</button></td>
                            </tr>
                            <tr>
                                <td>School solution</td>
                                <td><textarea name="solution" type="text" style="height: 100px; resize: none" required></textarea></td>
                            </tr>
                        </table><br>  
                        <button><a href="home">Back to Home</a></button>
                        <button><a href="view">Back to Search</a></button>
                        <button value="submit">Save</button>
                    </c:if>
                </form>
                <c:if test="${req.status!=0}">
                    <tr>
                        <td>Request State</td>
                        <td><input type="radio" name='stt' ${req.status==1?"checked":""}> <label id="blue">Approved</label>
                            <input type="radio" name='stt' ${req.status==-1?"checked":""}> <label id="failed">Rejected</label>
                        </td>
                    </tr>          
                    <tr>
                        <td>Date Closed</td>
                        <td><input type=text style="width: 160px" value="${req.getCloseDate().toString().substring(0, 10)}" readonly></td>
                    </tr>
                    <tr>
                        <td>Solved by </td>
                        <td><input  id="fixed" type="text" value="${tname}" readonly > </td>
                    </tr>
                    <tr>
                        <td>Attach (if any)</td>
                        <td><button>Download</button></td>
                    </tr>
                    <tr>
                        <td>School solution</td>
                        <td><textarea id="fixed" type="text" style="height: 100px; resize: none" readonly>${req.solution}</textarea></td>
                    </tr>
                    </table><br>  
                    <button><a href="home">Back to Home</a></button>
                    <button><a href="view">Back to Search</a></button>
                </c:if>
            </div>
        </div>
    </body>
</html>

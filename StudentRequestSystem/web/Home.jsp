<%-- 
    Document   : Home
    Created on : Jun 1, 2021, 11:08:51 PM
    Author     : Kien Nguyen
--%>

<%@page import="entities.Request"%>
<%@page import="dal.RequestDAO"%>
<%@page import="entities.Department"%>
<%@page import="java.util.List"%>
<%@page import="dal.DepartDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    long millis = System.currentTimeMillis();
    java.util.Date date = new java.util.Date(millis);
    DateFormat df = new SimpleDateFormat("E dd/MM/yyyy", Locale.US);
    String nowdate = df.format(date);
%>
<%
    DepartDAO ddao = new DepartDAO();
    RequestDAO rdao = new RequestDAO();
    List<Request> list1 = rdao.getRequestToDay();
    List<Request> list2 = rdao.getRequestLastTwoDay();
    List<Department> listD = ddao.getListDepart();
    int size = listD.size();
    int[] dp1 = new int[size];
    if (list1 != null) {
        for (Request r1 : list1) {
            for (int i = 0; i < size; i++) {
                if (r1.getDepartId() == listD.get(i).getId()) {
                    dp1[++i]++;
                }
            }
        }
    }
    int[] dp2 = new int[size];
    if (list2 != null) {
        for (Request r1 : list2) {
            for (int i = 0; i < size; i++) {
                if (r1.getDepartId() == listD.get(i).getId()) {
                    dp2[++i]++;
                }
            }
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Home Page</title>
    </head>
    <body>      
        <p name="list1" hidden> ${list1}</p>
        <p name="list2" hidden> ${list2} </p>
        <jsp:include page="Header.jsp"></jsp:include>      
            <div id="main-content">
            <jsp:include page="Left.jsp"></jsp:include>      
                <div id="main-panel">
                <jsp:include page="Login.jsp"></jsp:include>      
                <c:if test="${sessionScope.a != null}">
                    <p id="big-blue"> Request received by today - <%=nowdate%></p>          

                    <% if (list1.size() != 0) { %>
                    <table>
                        <tr>
                            <th style="width: 200px">Department name</th>
                            <th>Number of request</th>
                            <th>View detail</th>
                        </tr>
                        <%
                            for (int i = 0; i < size; i++) {
                                if (dp1[i] != 0) {
                        %>
                        <tr>
                            <td><%= ddao.getDepartById(i).getName()%></td>
                            <td><%=dp1[i]%></td>
                            <td><a href="viewlist?choice=1&&departid=<%=ddao.getDepartById(i).getId()%>">View </a></td>
                        </tr>
                        <%          }
                            }
                        %>
                    </table>
                    <%} else { %>
                    <p id="failed">No request today</p> 
                    <%}%>
                    <p id="big-blue"> Request received by last 2 days </p>  
                    <% if (list2.size() != 0) {
                    %>
                    <table>
                        <tr>
                            <th style="width: 200px">Department name</th>
                            <th>Number of request</th>
                            <th>View detail</th>
                        </tr>
                        <%
                            for (int i = 0; i < size; i++) {
                                if (dp2[i] != 0) {
                        %>
                        <tr>
                            <td><%= ddao.getDepartById(i).getName()%></td>
                            <td><%=dp2[i]%></td>
                            <td><a href="viewlist?choice=2&departid=<%=ddao.getDepartById(i).getId()%>">View </a></td>
                        </tr>
                        

                        <%          }
                            }
                        %>
                    </table>
                    <%} else {%>
                    <p id="failed">No request 2 days ago</p>
                    <%}%>
                </c:if>                                     
            </div>
        </div>
    </body>

</html>

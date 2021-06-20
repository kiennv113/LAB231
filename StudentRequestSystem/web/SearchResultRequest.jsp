<%-- 
    Document   : ViewRequest
    Created on : Jun 4, 2021, 8:54:30 AM
    Author     : Kien Nguyen
--%>

<%@page import="entities.Department"%>
<%@page import="java.util.List"%>
<%@page import="dal.DepartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div id="main-panel" style="position: absolute">
                    <p id="big-blue">View Requests</p>
                    <form action="search" method="get" id="formsearch">
                        <div> <h4><label >Select department </label> <span>
                                <select name="depart">
                                        <option value="0" ${departId==d.id?"selected":""}>All</option>
                                    <c:forEach items="${listD}" var="d">
                                        <option value="${d.id}" ${departId==d.id?"selected":""}>${d.name}</option>
                                    </c:forEach>                                      
                                </select>
                            </span>
                        </h4>

                    </div>
                    <div>
                        <h4>or Enter request title
                            <span>
                                <input type="text" name="txtSearch" value="${txtSearch}"> 
                                <button type="submit"> View </button>
                            </span>
                        </h4> 
                    </div>
                </form>
                <c:if test="${txtSearch!=null}">
                    <c:if test="${count!=0}">
                        <table>
                            <tr>
                                <th>Request title</th>
                                <th style="width: 150px">Date created</th>
                                <th style="width: 150px">Close created</th>
                                <th>Status</th>
                                <th>Report to</th>
                                <th>Detail</th>
                            </tr>
                            <c:forEach items="${listR}" var="r">
                                <tr>
                                    <td id="rtitle" style="color: green">${r.title}</td>
                                    <td>${r.date}</td>
                                    <td>${r.closeDate==null?"N/A":r.closeDate}</td>
                                    <td>${r.status==0?"in progess":(r.status==1?"approved":"reject")}</td>
                                    <td> ${listD[r.departId-1].name}</td>
                                    <td><a href="detail?id=${r.requestId}">${r.status==0?"Solve":"View"}</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${count==0}">
                        <p id="failed">Not found!</p>
                    </c:if>
                        <p>${mess}</p>
                </c:if>
            </div>
        </div>
    </body>
</html>

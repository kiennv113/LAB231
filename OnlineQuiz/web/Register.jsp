<%-- 
    Document   : Register
    Created on : May 26, 2021, 11:48:29 AM
    Author     : Kien Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">

        <title>Register</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="Header.jsp"></jsp:include>
            <h4 class="loginFormTitle">Registration form</h4>
            <form action="register" method="post">       
                <table>
                    <tbody>
                        <tr>
                            <td>User Name: </td>
                            <td><input type="text" value="" name="username" required></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="password" name="password" required></td>
                        </tr>
                        <tr>
                            <td>Type</td>
                            <td>
                                <select name='type'>
                                    <option value='0' >Student</option>
                                    <option value='1' >Teacher</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td><input type="email" value="" name='email' required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Register"></td>
                        </tr>
                    </tbody>
                </table>
                <p class="failed">${mess}</p>            
            </form>
        </div>      
    </body>
</html>

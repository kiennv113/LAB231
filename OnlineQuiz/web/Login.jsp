<%-- 
    Document   : Login
    Created on : May 25, 2021, 9:33:06 AM
    Author     : Kien Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style.css">
        <title>Login</title>
    </head>
    <body>
          <h4 id="loginFormTitle">Login Form</h4>
        <form action="login" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>User Name: </td>
                        <td><input type="text" value="" name="user" ></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="pass"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="submit" >Submit</button>
                            <a href="Register.jsp">Register</a>
                        </td>
                    </tr>
                </tbody>
                
            </table>
            <a class="failed">${mess}</a>                 
        </form>
    </body>
</html>

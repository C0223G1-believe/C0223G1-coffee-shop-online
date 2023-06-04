<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/4/2023
  Time: 8:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <form style="color: white; margin-top: 10em" action="/User?action=edit" method="post">
        <table>
            <tr>


                <td> <label>id: </label></td>
                <td> <input name="id" value="${user.id}" readonly></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>


        <label>User name: </label>
        <input name="userName" value="${user.userName}"/>
        <br>
        <label>Password: </label>
        <input name="password" value="${user.userPassword}"/>
        <br>
        <label>Email: </label>
        <input name="email" value="${user.userEmail}"/>
        <br>
        <label>Phone number: </label>
        <input name="phoneNumber" value="${user.userPhoneNumber}"/>
        <br>
        <label>Type User: </label>
        <select name="typeUser">
            <c:forEach var="typeUser" items="${listTypeUser}" varStatus="loop">
                <option  value="${typeUser.id}"> ${typeUser.name}</option>
            </c:forEach>
        </select>
        <br>
          <button type="submit">Edit</button>
    </form>
</div>
</body>
</html>

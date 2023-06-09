<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 07/06/2023
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <form style="color: white; margin-top: 10em" action="/productType?action=edit" method="post">
        <table style="color: white;">
            <tr><h1>Edit Product Type</h1></tr>
            <br>
            <br>
            <tr>
                <td><label>Product Type Id: </label></td>
                <td><input style="border-radius: 10px; border: none" name="id" value="${id}" readonly></td>
            </tr>
            <tr>
                <td><label>Type Product Name: </label></td>
                <td><input style="border-radius: 10px; border: none" name="name" value="${name}"/></td>
            </tr>

            <tr>
                <td>
                    <a href="/productType">
                        <button style="border-radius: 15px" class="btn btn-close-white w-100" type="button">< Back
                        </button>
                    </a>
                </td>
                <td>
                    <button style="border-radius: 15px" class="btn btn-primary w-100" type="submit">Edit</button>
                </td>
            </tr>

        </table>
    </form>
</div>
<%--<%--%>
<%--} else {%>--%>
<%--<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
</body>
</html>

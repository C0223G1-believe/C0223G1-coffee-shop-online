<%@ page import="com.example.coffee_shop.product_type.model.ProductType" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 07/06/2023
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<center>--%>
<%--    <h1>Edit Product Type</h1>--%>
<%--</center>--%>
<%--<body>--%>
<%--<form action="/productType?action=edit" method="post">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><label for="id">Id Product</label></td>--%>
<%--            <td><input  readonly name="id" id="id" value="${id}"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="productType">Product Type</label></td>--%>
<%--            <td><input name="productType" id="productType" type="text" value="${name}"></td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <input type="submit" value="SUBMIT">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<%--%>
<%--    ProductType productType = (ProductType) session.getAttribute("productType");--%>
<%--    if (productType != null && productType.getRole().getId() == 1) {--%>
<%--%>--%>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <form style="color: white; margin-top: 10em" action="/productType?action=edit" method="post">
        <table style="color: white;">
            <tr><h1>Edit Product Type</h1></tr>
            <br>
            <br>
            <tr>
                <td><label>Product Type Id: </label></td>
                <td><input style="border-radius: 10px" name="id" value="${id}" readonly></td>
            </tr>
            <tr>
                <td><label>Type Product Name: </label></td>
                <td><input style="border-radius: 10px" name="name" value="${name}"/></td>
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

<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/7/2023
  Time: 8:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>cart</title>
    <style>
        a {
            text-decoration: none;
        }

        table {
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h1>CART</h1>
<table border="1px" width="40%">
    <tr>
        <th>No</th>
        <th>Name</th>
        <th>Quantity</th>
        <th>price</th>
        <th>money</th>
        <th>action</th>
    </tr>
    <c:set var="o" value="${sessionScope.cart}"/>
    <c:forEach items="${o.items}" var="i" varStatus="look">
<tr>
    <td>${look.count}</td>
    <td>${i.product.productName}</td>
    <td>
        <button><a href="/process?action=quanitity&num=-1&id=${i.product.productID}">-</a></button>
        <input type="text" readonly value="${i.quanitity}">
        <button><a href="/process?action=quanitity&num=1&id=${i.product.productID}">+</a></button>
    </td>
    <td>${i.product.productPrice}</td>
    <td>${i.quanitity*i.product.productPrice}</td>
    <td>
        <button><a href="/process?action=delete&id=${i.product.productID}">Return item</a></button>
    </td>
</tr>
    </c:forEach>
</table>
<label>Toltal money</label><span>${o.totalMoney}</span>
<br>
<form action="/process" method="post">
<textarea name="address" placeholder="address" required></textarea>
    <br>
<textarea name="note" placeholder="note"></textarea>
    <button type="submit">Buy</button>
</form>
<h2><a href="/process?action=back">back</a></h2>
<a></a>
</body>
</html>

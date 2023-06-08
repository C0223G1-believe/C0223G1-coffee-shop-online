<%@ page import="com.example.coffee_shop.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
    <style>
        .toast {
            background-color: #4eef04;
            color: #132c88;
            padding: 15px;
            border-radius: 30px;
            position: fixed;
            top: 100px;
            right: 0px;
            font-weight: bold;
            z-index: 1;
            display: none;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user != null && user.getRole().getId() == 1) {
%>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <form style="color: white; margin-top:8em" action="/product?action=search" method="post">
        <input type="name" name="name" placeholder="Enter Name Product">
        <button class="rounded-3 bg-primary" type="submit">Search</button>
    </form>
    <a class="btn btn-primary" href="/product?action=create" role="button">Add New Product</a>
    <table id="tableProduct" style="color: white" class="table table-striped col-lg-11">
        <thead>
        <tr>
            <th style="color: #14515b">Sequence Number</th>
            <th style="color: #14515b">Product Name</th>
            <th style="color: #14515b">Product Price</th>
            <th style="color: #14515b">Product Description</th>
            <th style="color: #14515b">Product Image</th>
            <th style="color: #14515b">Product Type</th>
            <th style="color: #14515b">Edit</th>
            <th style="color: #14515b">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${product.productName}"/></td>
            <td><c:out value="${product.productPrice}"/></td>
            <td><c:out value="${product.productDescription}"/></td>
            <td><img width="50px" height="30px" src="<c:out value="${product.productImage}"/>"></td>
            <td><c:out value="${product.typeProduct.name}"/></td>
            <td>
                <a class="text-decoration-none"
                   href="/product?action=update&id=${product.productID}&name=${product.productName}&price=${product.productPrice}&description=${product.productDescription}&type=${product.typeProduct.name}">
                    <button type="button" class=" btn btn-warning text-white bg-warning rounded-3">
                        Edit
                    </button>
                </a>
            </td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger rounded-3" data-bs-toggle="modal"
                        data-bs-target="#exampleModal"
                        onclick="remove(${product.productID},'${product.productName}')">
                    Delete
                </button>
            </td>
        </tr>

        </c:forEach>
        </tbody>
    </table>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Notification</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Are you sure delete this product with Name:
                    <span style="color:red;" id="nameDelete"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/product?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="toastMessage" class="toast" style="background-color:#4eef04;color: #132c88; padding: 15px;border-radius: 30px;
position: fixed ;top: 100px;right: 0px;font-weight: bold;z-index: 1;display: none;"></div>
<script src="/library/jquery/jquery-3.5.1.min.js"></script>
<script src="/library/datatables/js/jquery.dataTables.min.js"></script>
<script src="/library/datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="/library/bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }


</script>
<%
} else {%>
<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>
<%
    }
%>
</body>
</html>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
<%
    String toast = (String) request.getAttribute("toast");
    if (toast.equals("add")) {
%>
<script>
    function showToast(toastMess) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = toastMess;

        setTimeout(function () {
            toast.style.display = "none";
        }, 1500); // Hide the toast message after 1,5 seconds
    }

    window.addEventListener('load', function () {
        showToast("Add success!");
    });
</script>
<%
    }else if (toast.equals("edit")){
%>
<script>
    function showToast(toastMess) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = toastMess;

        setTimeout(function () {
            toast.style.display = "none";
        }, 1500); // Hide the toast message after 1,5 seconds
    }

    window.addEventListener('load', function () {
        showToast("Edit success!");
    });
</script>
<%
    }
%>
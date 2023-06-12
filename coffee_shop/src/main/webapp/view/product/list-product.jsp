<%@ page import="com.example.coffee_shop.model.user.model.User" %><%--
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
    <title>Product List</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
    <style>
        .toast {
            background-color: #bbc031;
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
    <c:if test='${message != null}'>
        <center>
            <div id="toastMessage" class="toast"></div>
        </center>
    </c:if>
    <h1 style="text-align: center; margin-top: 3em">List Product</h1>
    <div style="display: flex; justify-content: space-between">
        <form style="color: white;margin-bottom: 0; margin-left: 20px" action="/product?action=search" method="post">
            <input type="name" name="name" placeholder="Enter Name Product" style="padding: 6px;border-radius: 20px; border: none">
            <button type="submit" style="color: white;padding: 6px;background-color: #c0c031;border-radius: 20px; border: none">
                Search
            </button>
        </form>
        <a class="btn"
           style="margin-right: 20px; margin-bottom: 16px ;padding: 6px;background-color: #c0c031;border-radius: 20px"
           href="/product?action=create" role="button">Add New Product
        </a>
    </div>
    <table id="tableProduct" style="color: white" class="table table-striped col-lg-11">
        <thead>
        <tr>
            <th style="color: #ffffff">Sequence Number</th>
            <th style="color: #ffffff">Product Name</th>
            <th style="color: #ffffff">Product Price</th>
            <th style="color: #ffffff">Product Description</th>
            <th style="color: #ffffff">Product Type</th>
            <th style="color: #ffffff">Edit</th>
            <th style="color: #ffffff">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}" varStatus="loop">
            <tr>
                <td style="color: white"><c:out value="${loop.count}"/></td>
                <td style="color: white"><c:out value="${product.productName}"/></td>
                <td style="color: white"><c:out value="$${product.productPrice}"/></td>
                <td style="color: white"><c:out value="${product.productDescription}"/></td>
                <td style="color: white"><c:out value="${product.typeProduct.name}"/></td>
                <td>
                    <a class="text-decoration-none"
                       href="/product?action=update&id=${product.productID}&name=${product.productName}&price=${product.productPrice}&description=${product.productDescription}&type=${product.typeProduct.name}&image=${product.productImage}">
                        <button type="button" class=" btn btn-warning text-white bg-warning rounded-3">
                            Edit
                        </button>
                    </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <input name="toast" value="delete" hidden>
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
                <h5>Are you sure delete this product with Name:<br>
                    <span style="color:red;" id="nameDelete"></span></h5>
                <h5>This data cannot be recovered.</h5>
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
        showToast("${message}");
    });
</script>
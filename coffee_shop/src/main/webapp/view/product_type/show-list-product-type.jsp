<%@ page import="com.example.coffee_shop.model.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 07/06/2023
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--Phần css--%>
<%--Phần css--%>
<html>
<head>
    <title>Cao-C0123G1</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
    <%--    toast--%>
    <style>
        /* Styling for the toast message */
        #toastMessage {
            background-color: #c0c031;
            color: #132c88;
            padding: 15px;
            border-radius: 30px;
            position: fixed;
            top: 100px;
            right: 0px;
            font-weight: bold;
            z-index: 1;
            display: none;
            animation: slideInRight ease 0.5s, fadeOut linear 2s 5s forwards;
            transition: all linear 0.3s;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(calc(100% + 3em));
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
            }
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
    <%--    Search--%><h1 STYLE="margin-top:3em;text-align: center">List Product Type</h1>

    <div style="display: flex; justify-content: space-between">
        <form style="color: white;margin-left: 20px"
              action="/productType?action=search" method="post">
            <input type="name" name="name" placeholder="Enter Name Product" style="padding: 6px;border-radius: 20px;border: none">
            <button style="color: white;padding: 6px;background-color: #c0c031;border-radius: 20px; border: none" class="rounded-3"
                    type="submit">Search
            </button>
        </form>
        <a style="margin-right: 20px; margin-bottom: 16px ;padding: 6px;background-color: #c0c031;border-radius: 20px" class="btn" href="productType?action=create"
           role="button">Create Product Type
        </a>
    </div>


    <%--    Crate--%>
    <table id="tableProduct" style="color: white" class="table table-striped col-lg-11">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productTypeList}" var="productType" varStatus="look">
            <tr>
                <td>${look.count}</td>
                <td>${productType.productTypeName}</td>
                <td>
                    <a class="text-decoration-none"
                       href="/productType?action=edit&id=${productType.productTypeId}&name=${productType.productTypeName}">
                        <button type="button" class=" btn btn-warning text-white bg-warning rounded-3">
                            Edit
                        </button>
                    </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger rounded-3" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="remove(${productType.productTypeId},'${productType.productTypeName}')">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--        hien thi toast--%>
    <div id="toastMessage" class="toast"></div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Warning: This action you can't undo</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5>Are you sure delete this product with Name: <span style="color:red;" id="nameDelete"></span></h5>
            </div>
            <div class="modal-footer">
                <form action="/productType?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/library/jquery/jquery-3.5.1.min.js"></script>
<script src="/library/datatables/js/jquery.dataTables.min.js"></script>
<script src="/library/datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="/library/bootstrap520/js/bootstrap.bundle.js"></script>
<script>


    // Phân trang thẻ <thead> bỏ trên phần tittle thẻ <tbody> bỏ phần body


    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        });
    });

    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }

</script>
<%--toast--%>
<%
    String success = String.valueOf(request.getAttribute("success"));
    if (success.equals("success")) {
%>
<script>
    // Function to show the toast message
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;

        setTimeout(function () {
            toast.style.display = "none";
        }, 1000); // Hide the toast message after 3 seconds
    }

    // Automatically show the toast message when the page is reloaded
    window.addEventListener('load', function () {
        showToast("You deleted success!");
    });
    <%}%>
</script>
<%
} else {%>
<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>
<%
    }
%>
</body>
</html>


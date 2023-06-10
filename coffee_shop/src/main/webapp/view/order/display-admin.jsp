<%@ page import="com.example.coffee_shop.model.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2023
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
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
            border-left: 0;
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
<c:if test="${show != null}">
    <div id="toastMessage" class="toast"></div>
</c:if>

<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <h1 style="margin-top:3em; margin-bottom: 0.8em; text-align: center">List Order</h1>
    <form style="color: white; margin-left: 20px" action="/Order?action=search" method="post">
        <div class="row d-inline-block me-2">
            <select name="status" style="padding: 6px;border-radius: 20px;border: none">
                <option value="">Choose Status</option>
                <c:forEach items="${listStatus}" var="listStatus">
                    <option value="${listStatus.nameStatus}"><c:out value="${listStatus.nameStatus}"/></option>
                </c:forEach>
            </select>
        </div>
        <input type="useName" name="email" placeholder="Enter User Name"
               style="padding: 6px;border-radius: 20px;border: none;display: inline-flex">
        <button style="color: white;padding: 6px;background-color: #c0c031;border-radius: 20px;border: none"
                type="submit">Search
        </button>
    </form>
    <table id="tableOrder" style="color: white" class="table table-striped col-lg-11">
        <thead>
        <tr>
            <th style="color: #14515b">STT</th>
            <th style="color: #14515b">User Name</th>
            <th style="color: #14515b">Order Date</th>
            <th style="color: #14515b">Address</th>
            <th style="color: #14515b">Comment</th>
            <th style="color: #14515b">Status</th>
            <th style="color: #14515b">Detail</th>
            <th style="color: #14515b">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${listOrder}" varStatus="loop">
            <tr>
                <td><c:out value="${loop.count}"/></td>
                <td><c:out value="${order.user.userName}"/></td>
                <td><c:out value="${order.orderDate}"/></td>
                <td><c:out value="${order.address}"/></td>
                <td><c:out value="${order.comment }"/></td>
                <td><c:out value="${order.statusOrder.nameStatus}"/></td>
                <td>
                    <a class="text-decoration-none" href="/Order?action=edit&id=${order.id}">
                        <button type="button" class=" btn btn-warning bg-warnimg text-white rounded-3">
                            Detail
                        </button>
                    </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger rounded-3" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" onclick="remove(${order.id},'${order.user.userName}')">
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
                <h4 style="font-size:15px">Are you sure to delete the customer's invoice with this name: <span
                        style="color:red;" id="nameDelete"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/Order?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/library/jquery/jquery-3.5.1.min.js"></script>
<script src="/library/datatables/js/jquery.dataTables.js"></script>
<script src="/library/datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="/library/bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableOrder').dataTable({
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
        showToast("${show}");
    });
</script>
<%
} else {%>
<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>
<%
    }
%>
</body>
</html>

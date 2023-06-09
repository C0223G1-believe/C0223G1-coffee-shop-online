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
        #success{
            position: fixed;
            right: 1em;
        }
        .son{
            contain: layout ;
            display: flex;
            align-items: center;
            background-color: wheat;
            border-radius: 12px;
            padding-bottom: 25px;
            min-width: 10em;
            max-width: 17em;
            max-height: 5rem;
            box-shadow: 0 5px 8px rgba(36, 245, 10, 0.08);
            animation: slideInRight ease 2s, fadeOut linear 1s 2s forwards;
            transition: all linear 0.3s;
        }
        @keyframes slideInRight {
            from{
                opacity: 0;
                transform: translateX(calc(100% + 1em) );
            }
            to{
                opacity: 1;
                transform: translateX(0);
            }
        }
        @keyframes fadeOut {
            to{
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
    <div id="success">
        <span class="son" style="margin-top: 4em;float: right; color: black; background-color: #12d53e">${show}</span>
    </div>
</c:if>

<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <h1 style="margin-top:3em; margin-bottom: 0.8em">List Order</h1>
    <form style="color: white; " action="/Order?action=search" method="post">
        <input type="useName" name="email" placeholder="Enter User Name">
        <input type="text" name="status" placeholder="Enter Status">
        <button class="rounded-3 bg-primary border-0" style="color: white" type="submit">Search</button>
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
                <h4 style="font-size:15px">Are you sure to delete the customer's invoice with this name: <span style="color:red;" id="nameDelete"></span></h4>
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
    setTimeout(function () {
        document.getElementById("success").style.display = "none";
        const main = document.getElementById("success");

    }, 3000);
</script>
<%
} else {%>
<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>
<%
    }
%>
</body>
</html>

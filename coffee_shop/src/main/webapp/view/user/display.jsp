<%@ page import="com.example.coffee_shop.model.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="/library/css/css-login/css-toast-delete.css">
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
            from{
                opacity: 0;
                transform: translateX(calc(100%+3em) );
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
    <div id="toastMessage" class="toast"></div>
</c:if>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">

    <h2 style="margin-top: 4em; text-align: center">List User </h2>
    <form style="color: white; float: left; margin-left: 20px" action="/User?action=search" method="post">
        <input type="text" name="phone" placeholder="Enter Phone" style="padding: 6px;border-radius: 20px;border: none">
        <button  type="submit" style="color: white;padding: 6px;background-color: #c0c031;border-radius: 20px;border: none">Search</button>
    </form>
    <table id="tableUser" style="color: white" class="table table-striped col-lg-11">
        <thead>
        <tr>
            <th style="color: white">STT</th>
            <th style="color: white">user name</th>
            <th style="color: white">password</th>
            <th style="color: white">email</th>
            <th style="color: white">phone number</th>
            <th style="color: white">type user</th>
            <th style="color: white">Edit</th>
            <th style="color: white">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}" varStatus="loop">
            <tr>
                <td style="color: white"><c:out value="${loop.count}"/></td>
                <td style="color: white"><c:out value="${user.userName}"/></td>
                <td style="color: white"><c:out value="${user.userPassword}"/></td>
                <td style="color: white"><c:out value="${user.userEmail}"/></td>
                <td style="color: white"><c:out value="${user.userPhoneNumber}"/></td>
                <td style="color: white"><c:out value="${user.role.name}"/></td>
                <td>
                    <a class="text-decoration-none" href="/User?action=edit&id=${user.id}">
                        <button type="button" class=" btn btn-warning bg-warnimg text-white rounded-3">
                            Edit
                        </button>
                    </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger rounded-3" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" onclick="remove(${user.id},'${user.userName}')">
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
                <h5>Are you sure delete this user with userName:
                    <span style="color:red;" id="nameDelete"></span>
                </h5>
                <h5>This data cannot be recovered.</h5>
            </div>
            <div class="modal-footer">
                <form action="/User?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary" onclick="showErrorToast()">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="toast">

</div>
</div>
<script src="/library/jquery/jquery-3.5.1.min.js"></script>
<script src="/library/datatables/js/jquery.dataTables.min.js"></script>
<script src="/library/datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="/library/bootstrap520/js/bootstrap.bundle.js"></script>
<script>

    $(document).ready(function () {
        $('#tableUser').dataTable({
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
</body>
</html>

<%
} else {%>
<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>
<%
    }
%>



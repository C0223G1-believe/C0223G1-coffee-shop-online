<%--
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
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <%--    Search--%><h1 STYLE="margin-top:3em;text-align: center" >List Product Type</h1>

        <a style="justify-content:start" class="btn btn-primary" href="productType?action=create" role="button">Create
            Product Type</a>

        <form style="color: white; margin-top:auto;margin-left:52em;justify-content: end ;display: inline-flex"
              action="/productType?action=search" method="post">
            <input type="name" name="name" placeholder="Enter Name Product">
            <button style="color: white" class="rounded-3 bg-primary" type="submit">Search</button>
        </form>



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
                    <%--                <td>--%>
                    <%--                    <a href="/productType?action=edit&id=${productType.productTypeId}&name=${productType.productTypeName}">Edit</a>--%>
                    <%--                    <a href="/productType?action=delete&id=${productType.productTypeId}">Delete</a>--%>
                    <%--                </td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<%--        hien thi toast--%>
        <div id="toastMessage" class="toast"></div>
</div>

<%--<script>--%>
<%--    setTimeout(function displaySuccess() {--%>
<%--        document.getElementById("success").style.display = "none";--%>
<%--    },1000)--%>
<%--</script>--%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Warning:  This action you can't undo</h1>
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
if (success.equals("success")){
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

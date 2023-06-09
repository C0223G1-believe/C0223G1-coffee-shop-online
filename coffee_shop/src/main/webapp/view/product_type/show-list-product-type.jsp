<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 07/06/2023
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<html STYLE="display: none">--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <center>--%>
<%--        <h1>List product type</h1>--%>
<%--        <br>--%>
<%--        <a href="/productType?action=create">Add new product type</a>--%>
<%--    </center>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post" action="">--%>
<%--    <table border="1" cellpadding="5">--%>
<%--        <tr >--%>
<%--            <th>STT</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Action</th>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${productTypeList}" var="productType" varStatus="look">--%>
<%--            <tr>--%>
<%--                <td>${look.count}</td>--%>
<%--                <td>${productType.productTypeName}</td>--%>
<%--                <td>--%>
<%--                    <a href="/productType?action=edit&id=${productType.productTypeId}&name=${productType.productTypeName}">Edit</a>--%>
<%--                    <a href="/productType?action=delete&id=${productType.productTypeId}">Delete</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>

<%--</form>--%>

<%--</body>--%>
<%--</html>--%>
<%--Phần css--%>
<%--Phần css--%>
<%--Phần css--%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">
    <form style="color: white; margin-top:8em" action="/productType?action=search" method="post">
        <input type="name" name="name" placeholder="Enter Name Product">
        <button class="rounded-3 bg-primary" type="submit" style="color: white">Search</button>
    </form>
    <a class="btn btn-primary" href="productType?action=create" role="button">Create Product Type</a>
    <table id="tableProduct"  style="color: white"class="table table-striped col-lg-11">
        <tr >
            <th style="color: white">STT</th>
            <th style="color: white">Name</th>
            <th style="color: white">Edit</th>
            <th style="color: white">Delete</th>
        </tr>
        <c:forEach items="${productTypeList}" var="productType" varStatus="look">
            <tr>
                <td style="color: white">${look.count}</td>
                <td style="color: white">${productType.productTypeName}</td>
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
                <h5>Are you sure delete this product with Name:
                    <span style="color:red;" id="nameDelete"></span></h5>
                <h5>This data cannot be recovered.</h5>
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

<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/6/2023
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<c:import url="/navbar-admin.jsp"> </c:import>
<div class="container">
    <form action="/Order?action=edit" style="color: white; margin-top:9em" method="post">
        <table id="tableDetailOrder" class="table table-striped col-lg-11">
            <thead>
            <tr>
                <th style="color: #14515b">STT</th>
                <th style="color: #14515b">User name</th>
                <th style="color: #14515b">Image</th>
                <th style="color: #14515b">Product</th>
                <th style="color: #14515b">Price</th>
                <th style="color: #14515b">Quality</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="detailOrder" items="${listDetailOrder}" varStatus="loop">
                <tr>
                    <td><c:out value="${loop.count}"/></td>
                    <td><c:out value="${detailOrder.order.user.userName}"/></td>
                    <td><img width="40rem" height="40rem" src="/<c:out value="${detailOrder.product.productImage}"/>">
                    </td>
                    <td><c:out value="${detailOrder.product.productName}"/></td>
                    <td><c:out value="${detailOrder.product.productPrice}"/></td>
                    <td><c:out value="${detailOrder.quality }"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button type="button" class="btn btn-primary btn-outline-light rounded-3 text-center" data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                onclick="update(${showOrder.id},${showOrder.statusOrder.id},'${showOrder.user.userName}')">
            Status Change
        </button>
    </form>
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
                <h4>you updated the user's order status <span style="color:red;" id="nameUser"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/Order?action=edit" method="post">
                    <input type="hidden" name="order" id="idOrder">
                    <input type="hidden" name="status" id="idStatus">
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
        $('#tableDetailOrder').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });

    function update(idOrder, idStatus, nameUser) {
        document.getElementById("idOrder").value = idOrder;
        document.getElementById("idStatus").value = idStatus;
        document.getElementById("nameUser").innerText = nameUser;

    }
</script>
</body>
</html>
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

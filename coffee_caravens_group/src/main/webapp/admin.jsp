<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/29/2023
  Time: 6:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            padding: 0;
        }

        th {
            text-align: center;
        }

    </style>
</head>
<body>
<!--head-->
<div class="container-fluid">
    <c:import url="navbar-admin.jsp"></c:import>
    <!--content-->

    <div class="row container-fluid mt-3 ">
        <div class="col-12 col-md-12 col-lg-1 ">
            <button type="button" class="btn btn-secondary px-3 py-0 border-primary ">Add Product</button>
        </div>
        <div class="col-12 col-md-11 col-lg-11 pe-0 ">
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Image</th>
                    <th>Name Product</th>
                    <th>Price</th>
                    <th>Descripton</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <tr>
                    <td class="col-1">1</td>
                    <td class="col-2">adasl</td>
                    <td class="col-2">asdasd</td>
                    <td class="col-2">7210312</td>
                    <td class="col-5">ueia asdhausd asdyla dasdioas asdaoiui quweoi qwei wqeiqwue qweuoq sasd asda dasd
                        sadad sad asd asd asdkasdkan sadiaj asdjajsd daisdajdia adjajdia jiadnaisd asdjpijdasjdi
                        pijansdja asidjijsadojasid asjdijasd
                    </td>

                    <td>
                        <button class="btn-secondary mx-2 rounded-2 px-2 border-primary">Edit</button>
                    </td>
                    <td>
                        <button class="btn-secondary mx-2 rounded-2 px-2 border-primary">Delete</button>
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>

</body>
<script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
<script src="bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</html>

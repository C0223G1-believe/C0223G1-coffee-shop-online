<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/30/2023
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<div class="col-12 col-md-12 col-lg-12">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Quản Lý </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#"><i
                                class="fa-solid fa-coffee-bean"></i>Product</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">User</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <form>
                            <input type="text" name="name" class="rounded-3" placeholder="Search by name ">
                            <button class="rounded-3" type="submit"> Search</button>
                        </form>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <p class="nav-link" href="#"><i class="fa-solid fa-user"></i> Admin</p>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa-solid fa-outdent"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>

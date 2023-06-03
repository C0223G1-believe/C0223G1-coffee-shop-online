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
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <img src="images/logo/logo.jpg" height="80" width="160"/>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="fw-bold nav-link active" aria-current="page" href="#" style="font-size: 30px;
                      margin-left: 50px">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="fw-bold   nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false"
                       style="font-size: 30px;margin-left: 35px; margin-right: 50px">
                        Menu
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="fw-bold dropdown-item" href="#">Coffee</a></li>
                        <li><a class="fw-bold dropdown-item" href="#">Tea</a></li>
                        <li><a class="fw-bold dropdown-item" href="#">Juice</a></li>
                        <li><a class="fw-bold dropdown-item" href="#">Soda</a></li>
                        <li><a class="fw-bold dropdown-item" href="#">Ice Cream</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="fw-bold dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav ">
                <form class="d-flex" style="position: relative;width: 80%">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                           style="width: 60%">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </ul>
            <ul class="navbar-nav">
                <li>
                    <a class="fw-bold dropdown-item" href="#">
                        <i class="fa-solid fa-user"></i> Account</a>
                </li>
                <li>
                    <a class="fw-bold dropdown-item" href="#">
                        <i class="fa-solid fa-cart-shopping"></i> Cart</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>

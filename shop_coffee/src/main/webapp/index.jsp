<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login/Đăng nhập</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="container-fluid">
    <c:import url="navbar-home.jsp"></c:import>
    <section class="h-100" style="background-color: gray;">
        <div class="container">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-12 col-xl-11">
                    <div class="card text-black" style="border-radius: 25px;">
                        <div class="card-body p-md-5">
                            <div class="row justify-content-center">
                                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                    <form class="mx-1" action="/LoginServlet?action=signIn " method="post">
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <div class="form-outline flex-fill mb-0">
                                                <label class="form-label" for="form3Example2c">User name </label>
                                                <input type="text" id="form3Example2c" name="user"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <div class="form-outline flex-fill mb-0">
                                                <label class="form-label" for="form3Example4c">Password</label>
                                                <input type="password" id="form3Example4c" name="pass"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content mb-3 mb-lg-4">
                                            <button type="submit" class=" btn btn-primary btn-lg font-monospace"
                                                    style="width: 100%">Sign in
                                            </button>
                                        </div>
                                    </form>
                                    <div class="d-flex ms-1 mb-lg-4">
                                        <button type="button" class="btn btn-primary btn-lg" style="width: 100%"><a
                                                class="text-decoration-none text-white"
                                                href="/LoginServlet?action=signUp ">Sign up</a>
                                        </button>
                                    </div>

                                </div>
                                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                    <img src="images/logo/welcome.png" class="img-fluid" alt="Sample image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</div>
</body>
<script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
<script src="bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</html>
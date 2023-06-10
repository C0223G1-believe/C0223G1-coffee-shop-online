<%@ page import="com.example.coffee_shop.model.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/3/2023
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title> Add New</title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
   </head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user != null && user.getRole().getId() == 1) {
%>
<%
    String message = (String) request.getAttribute("notification");
    if (message == null) {
        message = "";
    }
%>
<section class="vh-100" style="background-color: #6c6e72;">
    <div class="container-fluid h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <form method="post" action="/product?action=create">
                    <div class="card text-black" style="border-radius: 25px;">
                        <div class="card-body p-md-5">
                            <div class="row justify-content-center">
                                <div class="col-md-10 col-lg-8 col-xl-5 order-2 order-lg-1">
                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New Product</p>
                                    <form class="mx-1 mx-md-4">
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input name="name" type="text" id="name" class="form-control"
                                                       title="Example 'Black Coffee'" required
                                                       pattern="(^[a-zA-Z]{1,30} [a-zA-Z]{1,30}$)">
                                                <input name="toast" value="add" hidden>
                                                <label class="form-label" for="name">Product Name</label>
                                                <p style="color: red"><%=message%>
                                                </p>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fa-regular fa-money-bill-1 fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input name="price" type="number" id="price"
                                                       class="form-control" required/>
                                                <label class="form-label" for="price">Product Price</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fa-solid fa-audio-description fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input name="description" type="text" id="description"
                                                       class="form-control" required/>
                                                <label class="form-label" for="description">Product
                                                    Description</label>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fa-solid fa-mug-hot fa-lg me-3 fa-fw"></i>
                                            <select name="type" class="form-select" aria-label="Default select example">
                                                <option value="1" selected>Traditional Coffee</option>
                                                <option value="2">Machine Coffee</option>
                                                <option value="3">Tea</option>
                                                <option value="4">Juice</option>
                                            </select>
                                        </div>
                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <input name="image" type="file" id="myFile" accept="image/*" required>
                                        </div>
                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                                        </div>
                                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                            <a class="btn btn-outline-primary" href="/product">Back</a>
                                        </div>
                                    </form>

                                </div>
                                <%--                            Chọn ảnh--%>
                                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                    <img style="width: 90% ; height: 600px" src="#" class="img-fluid" alt="Preview"
                                         id="previewImage">

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</form>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    // Lắng nghe sự kiện khi người dùng chọn hình ảnh
    document.getElementById('myFile').addEventListener('change', function (e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        // Đọc file hình ảnh và hiển thị trên thẻ <img>
        reader.onload = function (e) {
            document.getElementById('previewImage').src = e.target.result;
        };

        // Đọc nội dung của file hình ảnh
        reader.readAsDataURL(file);
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
<script src="myscrip.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

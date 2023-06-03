<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/29/2023
  Time: 7:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>COFFEE CARAVENS GROUP</title>
  <link rel="stylesheet" href="../CSS/coffee.css">
  <link rel="stylesheet" href="../bootstrap-5.3.0-alpha3-dist/css/bootstrap.css">

</head>
<body>
<!--header-->
<div class="bg-dark header">COFFEE CARAVENS GROUP</div>
<!--header-menu-->
<div class="container-fluid">
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="">
      <a class="navbar-brand" href="#">ADDRESS</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">PUBLIC</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">INFORMATION</a>

          </li>

          <li>
            <!--          search-->

            <!--          Cart-->
            <button class="btn btn-sm" type="submit">Cart <img src="../images/logo/gio.png" height="20"
                                                               width="29"/></button>
            <!--          Sign in-->
            <button class="btn btn-sm" type="submit">Sign in <img src="../images/logo/login.png" height="22"
                                                                  width="22"/></button>
          </li>
        </ul>

       <ul>
         <div class="input">
           <input placeholder="Find your favourite products...">
         </div>
         <div class="img">
           <img src="../images/logo/tải%20xuống.png" height="25" width="25"/>
         </div>

       </ul>
       </div>

      </div>

  </nav>
</div>
<!--slide show-->
<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">

      <img src="../images/slide/pngtree-brown-simple-texture-coffee-background-image_1555.jpeg" height="404"
           width="100%"/></div>
    <div class="carousel-item">

      <img src="../images/slide/pngtree-coffee-background-for-simple-coffee-restaurant-image_1506.jpeg"
           height="404" width="100%"/></div>
    <div class="carousel-item">

      <img src="../images/slide/pngtree-simple-style-coffee-green-leaf-striped-white-creative-banner-image_804313.jpeg"
           height="404" width="100%"/></div>
  </div>
</div>
<!--card-->
<!--coffee title-->
<div class="row mt-2 mb-2">
  <div class="col-lg-3"></div>
  <div CLASS="bg-dark col-lg-6 card-coffee-tittle">COFFEE</div>
  <div class="col-lg-3"></div>
</div>
<!--coffee card-->
<div class="card-coffee">
  <!--card 1-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/coffee/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 2-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 3-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/trà/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 4-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/tải%20xuống.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
</div>
<!--tea tittle-->
<div class="row mt-2 mb-2">
  <div class="col-lg-3"></div>
  <div CLASS="bg-dark col-lg-6 card-coffee-tittle">TEA</div>
  <div class="col-lg-3"></div>
</div>
<!--tea card-->
<div class="card-coffee">
  <!--card 1-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/coffee/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 2-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 3-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/trà/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 4-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/tải%20xuống.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
</div>
<!--soda tittle-->
<div class="row mt-2 mb-2">
  <div class="col-lg-3"></div>
  <div CLASS="bg-dark col-lg-6 card-coffee-tittle">SODA</div>
  <div class="col-lg-3"></div>
</div>
<!--soda card-->
<div class="card-coffee">
  <!--card 1-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/coffee/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 2-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 3-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/trà/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 4-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/tải%20xuống.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
</div>
<!--ice cream tittle-->
<div class="row mt-2 mb-2">
  <div class="col-lg-3"></div>
  <div CLASS="bg-dark col-lg-6 card-coffee-tittle">ICE CREAM</div>
  <div class="col-lg-3"></div>
</div>
<!--ice cream card-->
<div class="card-coffee">
  <!--card 1-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/coffee/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 2-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 3-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/trà/images.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
  <!--card 4-->
  <div class="product-container col-lg-3">
    <h2>Quản lý sản phẩm</h2>
    <div class="product-list">
      <div class="product-item">
        <div class="product-image">
          <img src="../images/nuoc_ep/tải%20xuống.jpeg" height="167" width="302"/>
          <div class="product-details">
            <h3>Product Name</h3>
            <p>Product Description</p>
            <p>Price: $10</p>
            <button>Edit</button>
            <button>Delete</button>
          </div>
        </div>
        <!-- Add more product items here -->
      </div>
      <button class="add-product-btn">Thêm sản phẩm mới</button>
    </div>
  </div>
</div>
<p id="abc">cf sua</p>
</body>
<script src="../JavaScript/coffee.js"></script>
<script src="../bootstrap-5.3.0-alpha3-dist/js/bootstrap.bundle.js"></script>
<script src="../bootstrap-5.3.0-alpha3-dist/js/bootstrap.js"></script>
</html>

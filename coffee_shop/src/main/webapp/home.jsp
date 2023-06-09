<%@ page import="com.example.coffee_shop.model.user.model.User" %>
<%@ page import="com.example.coffee_shop.model.product.service.ProductService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ProductService productService = new ProductService();%>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Home</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="library/css/linearicons.css">
    <link rel="stylesheet" href="library/css/font-awesome.min.css">
    <link rel="stylesheet" href="library/css/bootstrap.css">
    <link rel="stylesheet" href="library/css/magnific-popup.css">
    <link rel="stylesheet" href="library/css/nice-select.css">
    <link rel="stylesheet" href="library/css/animate.min.css">
    <link rel="stylesheet" href="library/css/owl.carousel.css">
    <link rel="stylesheet" href="library/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <style>
        .toast {
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
            animation: slideInLeft ease 2s, fadeOut linear 1s 2s forwards;
            transition: all linear 0.3s;
        }
    </style>
</head>
<body>
<header id="header" id="home">
    <div class="header-top">
        <div class="container">
            <div class="row justify-content-end">
                <div class="col-lg-8 col-sm-4 col-8 header-top-right no-padding">
                    <ul>
                        <li>
                            Mon-Fri: 8am to 2pm
                        </li>
                        <li>
                            Sat-Sun: 11am to 4pm
                        </li>
                        <li>
                            <a href="tel:(012) 6985 236 7512">(012) 6985 236 7512</a>
                        </li>
                        <li>
                            <a href="/cart.jsp"><i class="fa-solid success fa-cart-shopping"> ${size}</i></a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="/process?action=back"><img src="img/logo.png" alt="logo" title=""/></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="/process?action=back">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#coffee">Menu</a></li>
                    <li><a href="#review">Review</a></li>
                    <li><a href="#blog">Blog</a></li>
                    <li><a href="https://bocongan.gov.vn/">Page</a></li>
                    <li>
                        <div>
                            <%
                                User user = (User) session.getAttribute("user");
                                if (user == null) {
                            %>
                            <a href="/view/login-signUp/login.jsp" style="color: #c0c031; font-weight: bold">SIGN IN</a>
                            <%
                            } else if (user.getRole().getId()==1){%>
                            <a href="/User"><span style="color: #c0c031; font-weight: bold"><%=user.getUserName()%></span></a>
                            <a href="/LogOutServlet" style="color: #c0c031">log out</a>
                            <%
                                }else {%>
                            <span style="color: #c0c031; font-weight: bold"><%=user.getUserName()%></span>
                            <a href="/LogOutServlet" style="color: #c0c031">log out</a>
                        <% }
                            %>
                        </div>
                    </li>
                </ul>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->


<!-- start banner Area -->
<section class="banner-area">
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-start">
            <div class="banner-content col-lg-7">
                <h6 class="text-white text-uppercase">Now you can feel the Energy</h6>
                <h1>
                    Start your day with <br>
                    a black Coffee
                </h1>
                <%
                    if (user != null) {
                    } else {%>
                <a href="/view/login-signUp/login.jsp" class="primary-btn text-uppercase">Buy Now</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start video-sec Area -->
<section class="video-sec-area pb-100 pt-40" id="about">
    <div class="container">
        <div class="row justify-content-start align-items-center">
            <div class="col-lg-6 video-right justify-content-center align-items-center d-flex">
                <div class="overlay overlay-bg"></div>
                <a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid"
                                                                                            src="img/play-icon.png"
                                                                                            alt=""></a>
            </div>
            <div class="col-lg-6 video-left">
                <h6>Live Coffee making process.</h6>
                <h1>We Telecast our <br>
                    Coffee Making Live</h1>
                <p><span>We are here to listen from you deliver exellence</span></p>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temp or incididunt ut
                    labore et dolore magna aliqua. Ut enim ad minim.
                </p>
                <img class="img-fluid" src="img/signature.png" alt="">
            </div>
        </div>
    </div>
</section>
<!-- End video-sec Area -->
<!-- Start menu Area -->
<section class="menu-area section-gap" id="coffee">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">What kind of Coffee we serve for you</h1>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <c:forEach items="${productList}" var="product">
                <div class="col-3">
                    <div class="card" style="width: 100%;height: 90%">
                        <img height="150px" src="${product.productImage}" class="card-img-top" alt="photo">
                        <div class="card-body">
                            <h5 class="card-title">${product.productName}</h5>
                            <h3 class="card-title">$${product.productPrice}</h3>
                            <p class="card-text">${product.productDescription}</p>
                            <a style="background: #493434"
                               href="/BuyProdutServlet?id=${product.productID}&num=1&toast=s" class="btn btn-primary">Add
                                Card</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- End menu Area -->

<!-- Start gallery Area -->
<section class="gallery-area section-gap" id="gallery">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">What kind of Coffee we serve for you</h1>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <a href="img/g1.jpg" class="img-pop-home">
                    <img class="img-fluid" src="img/g1.jpg" alt="">
                </a>
                <a href="img/g2.jpg" class="img-pop-home">
                    <img class="img-fluid" src="img/g2.jpg" alt="">
                </a>
            </div>
            <div class="col-lg-8">
                <a href="img/g3.jpg" class="img-pop-home">
                    <img class="img-fluid" src="img/g3.jpg" alt="">
                </a>
                <div class="row">
                    <div class="col-lg-6">
                        <a href="img/g4.jpg" class="img-pop-home">
                            <img class="img-fluid" src="img/g4.jpg" alt="">
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a href="img/g5.jpg" class="img-pop-home">
                            <img class="img-fluid" src="img/g5.jpg" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End gallery Area -->

<!-- Start review Area -->
<section class="review-area section-gap" id="review">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">What kind of Coffee we serve for you</h1>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 single-review">
                <img src="img/r1.png" alt="">
                <div class="title d-flex flex-row">
                    <h4>lorem ipusm</h4>
                    <div class="star">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>
                </div>
                <p>
                    Accessories Here you can find the best computer accessory for your laptop, monitor, printer,
                    scanner, speaker. Here you can find the best computer accessory for your laptop, monitor, printer,
                    scanner, speaker.
                </p>
            </div>
            <div class="col-lg-6 col-md-6 single-review">
                <img src="img/r2.png" alt="">
                <div class="title d-flex flex-row">
                    <h4>lorem ipusm</h4>
                    <div class="star">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>
                </div>
                <p>
                    Accessories Here you can find the best computer accessory for your laptop, monitor, printer,
                    scanner, speaker. Here you can find the best computer accessory for your laptop, monitor, printer,
                    scanner, speaker.
                </p>
            </div>
        </div>
    </div>
</section>
<!-- End review Area -->

<!-- Start blog Area -->
<section class="blog-area section-gap" id="blog">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">What kind of Coffee we serve for you</h1>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 single-blog">
                <img class="img-fluid" src="img/b1.jpg" alt="">
                <ul class="post-tags">
                    <li><a href="#">Travel</a></li>
                    <li><a href="#">Life Style</a></li>
                </ul>
                <a href="#"><h4>Portable latest Fashion for young women</h4></a>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                    et dolore.
                </p>
                <p class="post-date">
                    31st January, 2018
                </p>
            </div>
            <div class="col-lg-6 col-md-6 single-blog">
                <img class="img-fluid" src="img/b2.jpg" alt="">
                <ul class="post-tags">
                    <li><a href="#">Travel</a></li>
                    <li><a href="#">Life Style</a></li>
                </ul>
                <a href="#"><h4>Portable latest Fashion for young women</h4></a>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                    et dolore.
                </p>
                <p class="post-date">
                    31st January, 2018
                </p>
            </div>
        </div>
    </div>
</section>
<!-- End blog Area -->

<div id="toastMessage" class="toast"></div>
<!-- start footer Area -->
<footer class="footer-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6>Designer By</h6>
                    <h3 style="color:#bbbb12;">Team 1:</h3>
                    <p>Tran Dinh Ngoc Sang</p>
                    <p>Ngguyen Viet Cao</p>
                    <p>Tran Thanh Son</p>
                    <p>Vo Hai Thanh</p>
                </div>
            </div>
            <div class="col-lg-5  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6>Where there is a will, there is a way.</h6>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6 social-widget">
                <div class="single-footer-widget">
                    <h6>Follow Us</h6>
                    <p>Let us be social</p>
                    <div class="footer-social d-flex align-items-center">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End footer Area -->
<%
    String flag = String.valueOf(request.getAttribute("check"));
    if (flag.equals("sa")) {
        request.removeAttribute("check");
%>
<script>
    // Function to show the toast message
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;

        setTimeout(function () {
            toast.style.display = "none";
        }, 1200); // Hide the toast message after 3 seconds
    }

    // Automatically show the toast message when the page is reloaded
    window.addEventListener('load', function () {
        showToast("Item Added to your Cart!");
    });
</script>
<%
    }
%>

<script src="library/js/vendor/jquery-2.2.4.min.js"></script>
<script src="library/https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="library/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="library/js/easing.min.js"></script>
<script src="library/js/hoverIntent.js"></script>
<script src="library/js/superfish.min.js"></script>
<script src="library/js/jquery.ajaxchimp.min.js"></script>
<script src="library/js/jquery.magnific-popup.min.js"></script>
<script src="library/js/owl.carousel.min.js"></script>
<script src="library/js/jquery.sticky.js"></script>
<script src="library/js/jquery.nice-select.min.js"></script>
<script src="library/js/parallax.min.js"></script>
<script src="library/js/waypoints.min.js"></script>
<script src="library/js/jquery.counterup.min.js"></script>
<script src="library/js/mail-script.js"></script>
<script src="library/js/main.js"></script>
</body>
</html>


<script>

    <%--<button type="button" onclick="addCart(${product.productID})"></button>--%>
    <%--function addCart(${id}) {--%>
    <%--<% productService.getProductById(${id})%>--%>
    }
</script>

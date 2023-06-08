<%@ page import="com.example.coffee_shop.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/4/2023
  Time: 7:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>Coffee</title>

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
<body class="bg-secondary">
<header id="header" id="home" class="bg-dark">
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
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class=" align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="index.html"><img src="img/logo.png" alt=" nhom 1" title=" " /></a>
            </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-active"><a href="/User">User Manager</a></li>
                        <li class="menu-active"><a href="/product">Product Manager</a></li>
                        <li class="menu-active"><a href="/Order">Bill Manager</a></li>
                        <li class="menu-active">
                            <div>
                                <%
                                    User user = (User) session.getAttribute("user");
                                    if (user == null) {
                                %>
                                <a href="/view/login-signUp/login.jsp" style="color: #c0c031;"> SIGN IN</a>
                                <%
                                } else {%>
                                <span style="color: #c0c031; font-weight: bold"><%=user.getUserName()%></span>
                                <a href="/LogOutServlet" style="color: #c0c031">log out</a>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                    </ul>
                </nav>
            <!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->
</body>
<script src="library/js/vendor/jquery-2.2.4.min.js"></script>
<script src="library/https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="library/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="dang-ky.css">
    <link rel="stylesheet" href="../../../../../bootstrap-5.3.0-alpha3-dist/css/bootstrap.css">
    <script src="../../../../../bootstrap-5.3.0-alpha3-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<section class="vh-100 bg-image"
         style="background-image: url('https://images.unsplash.com/photo-1620820186187-fc32e79adb74?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29mZmVlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60');">
        <div id="toast">
            <div class="toast toast--error">
                <div class="toast__icon">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
                <div class="toast__body">
                    <h3 class="toast__title">Success</h3>
                    <p class="toast__msg">${error}wqueoiqwueoqi</p>
                </div>
                <div class="toast__close">
                    <i class="fa-solid fa-circle-xmark"></i>
                </div>
            </div>
        </div>
    <div class="mask d-flex align-items-center h-100 gradient-custom-3 mt-0 mb-0">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card">
                        <div style="color: white">
                            <div class="card-body p-5" style="background:#1e1d1d">
                                <h4 class="text-uppercase text-center mb-2 mt-0 fw-bold">Create an account</h4>
                                <form class="mt-0" style="height: 30em" action="/User?action=add" method="post">
                                    <div class="form-outline mb-1">
                                        <input type="tel" id="form3Example1cr" value="${phone}" name="phone"
                                               pattern="^([0-9]{10})$" class="form-control form-control-lg"/>
                                        <label class="form-label" for="form3Example1cr">Phone Number</label>
                                    </div>
                                    <div class="form-outline mb-1">
                                        <input type="email" id="form3Example1cg" value="${email}" name="email"
                                               class="form-control form-control-lg"/>
                                        <label class="form-label" for="form3Example1cg">Your Email</label>
                                    </div>

                                    <div class="form-outline mb-1">
                                        <input type="text" id="form3Example3cg" name="userName" value="${name}"
                                               class="form-control form-control-lg"/>
                                        <label class="form-label" for="form3Example3cg">User Name</label>
                                    </div>

                                    <div class="form-outline mb-1">
                                        <input type="password" id="form3Example4cg" value="${pass1}" name="password1"
                                               class="form-control form-control-lg"/>
                                        <label class="form-label" for="form3Example4cg">Password</label>
                                    </div>

                                    <div class="form-outline mb-1">
                                        <input type="password" id="form3Example4cdg" value="${pass2}" name="password2"
                                               class="form-control form-control-lg"/>
                                        <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit"
                                                class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                                            Register
                                        </button>
                                    </div>
                                    <p class="text-center text-white mt-1 mb-0">Have already an account? <a
                                            href="/view/login-signUp/login.jsp"
                                            class="fw-bold text-white"><u>Login here</u></a></p>
                                </form>
                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</section>

</body>
</html>
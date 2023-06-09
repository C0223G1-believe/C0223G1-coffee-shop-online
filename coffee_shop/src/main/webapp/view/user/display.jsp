<%@ page import="com.example.coffee_shop.model.user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/library/bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/library/datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="/library/css/css-login/css-toast-delete.css">
    <style>
        #success{
            position: fixed;
            left: 1em;
        }
        .son{
            contain: layout ;
            display: flex;
            align-items: center;
            background-color: wheat;
            border-radius: 12px;
            border-left: 10px solid;
            min-width: 10em;
            max-width: 17em;
            max-height: 5rem;
            box-shadow: 0 5px 8px rgba(36, 245, 10, 0.08);
            animation: slideInLeft ease 2s, fadeOut linear 1s 3s forwards;
            transition: all linear 0.3s;
        }
        @keyframes slideInLeft {
            from{
                opacity: 0;
                transform: translateX(calc(100% + 1em) );
            }
            to{
                opacity: 1;
                transform: translateX(0);
            }
        }
        @keyframes fadeOut {
            to{
                opacity: 0;
            }
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user != null && user.getRole().getId() == 1) {
%>
<div id="success">
    <span class="son" style="margin-top: 4em;float: left; background-color: #00ffff; max-height: 100px; ">${show}</span>
</div>
<div id="success">
    <span class="son" style="margin-top: 4em;float: left; background-color: #12d53e; max-height: 100px">${edit}</span>
</div>
<div id="success">
    <span class="son" style="margin-top: 4em;float: left; background-color: #f60048; max-height: 100px">${delete}</span>
</div>
<c:import url="/navbar-admin.jsp"></c:import>
<div class="container">

    <h2 style="margin-top: 4em">List User </h2>
    <form style="color: white; float: right" action="/User?action=search" method="post">
        <input type="text" name="phone" placeholder="Enter Phone">
        <button class="rounded-3 bg-primary" type="submit">Search</button>
    </form>
    <table id="tableUser" style="color: white" class="table table-striped col-lg-11">
        <thead>
        <tr>
            <th style="color: white">STT</th>
            <th style="color: white">user name</th>
            <th style="color: white">password</th>
            <th style="color: white">email</th>
            <th style="color: white">phone number</th>
            <th style="color: white">type user</th>
            <th style="color: white">Edit</th>
            <th style="color: white">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}" varStatus="loop">
            <tr>
                <td style="color: white"><c:out value="${loop.count}"/></td>
                <td style="color: white"><c:out value="${user.userName}"/></td>
                <td style="color: white"><c:out value="${user.userPassword}"/></td>
                <td style="color: white"><c:out value="${user.userEmail}"/></td>
                <td style="color: white"><c:out value="${user.userPhoneNumber}"/></td>
                <td style="color: white"><c:out value="${user.role.name}"/></td>
                <td>
                    <a class="text-decoration-none" href="/User?action=edit&id=${user.id}">
                        <button type="button" class=" btn btn-warning bg-warnimg text-white rounded-3">
                            Edit
                        </button>
                    </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger rounded-3" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" onclick="remove(${user.id},'${user.userName}')">
                        Delete
                    </button>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
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
                <h5>Are you sure delete this user with userName:
                    <span style="color:red;" id="nameDelete"></span>
                </h5>
                <h5>This data cannot be recovered.</h5>
            </div>
            <div class="modal-footer">
                <form action="/User?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary" onclick="showErrorToast()">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="toast">

</div>
</div>
<script src="/library/jquery/jquery-3.5.1.min.js"></script>
<script src="/library/datatables/js/jquery.dataTables.min.js"></script>
<script src="/library/datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="/library/bootstrap520/js/bootstrap.bundle.js"></script>
<script>

    $(document).ready(function () {
        $('#tableUser').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }
    function main(
        title ='',
        message = '',
        type = 'info',
        duration = 3000
    ){
        let main = document.getElementById('toast');
        if (main){
            let toast = document.createElement('div');
            // auto remove
            let autoRemoveId = setTimeout(function (){
                main.removeChild(toast);
            })
            // remove toast when clicked
            toast.onclick = function (e){
                if (e.target.closest('.toast__close')){
                    main.removeChild(toast);
                }
            }
            toast.classList.add('toast',`toast--${type}`);
            toast.innerHTML = `
                <div class="toast__icon">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
                <div class="toast__body">
                    <h3 class="toast__title">${title}</h3>
                    <p class="toast__msg">${error}</p>
                </div>
                <div class="toast__close">
                    <i class="fa-solid fa-circle-xmark"></i>
                </div>
                `;
            main.appendChild('toast');
            window.addEventListener('load', function() {
                showToast("${error}");
            });
        }
    }

</script>
<script>
    setTimeout(function () {
        document.getElementById("success").style.display = "none";
        const main = document.getElementById("success");

    }, 3000);
</script>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<%
} else {%>
<h1 style="text-align: center; margin-top: 20%">ERROR 403</h1>
<%
    }
%>

</body>
</html>

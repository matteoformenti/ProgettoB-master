<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="progetto.*" %>
<html>
<head>
    <%=Util.getHeader("Login")%>
</head>
<body style="background: url('/img/wallhaven-192170.jpg') no-repeat;background-size: cover">
<div class="container row">
    <div class="col s12">
        <div class="card">
            <div class="card-content">
                <h4 class="blue-text center-align center-block light">Login</h4>
                <div class="row">
                    <input type="email" class="validate" id="email" placeholder="Email">
                    <input type="password" class="validate" id="password" placeholder="Password">
                </div>
                <div class="row">
                    <div class="btn-flat right blue-text waves-effect" onclick="attemptLogin()">Login</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col s12" id="errorDialog" style="display: none">
        <div class="card red">
            <div class="card-content">
                <h5 class="white-text center-align center-block">Username o password errati</h5>
            </div>
        </div>
    </div>
</div>
<%=Util.getFooter()%>
<script>
    function attemptLogin() {
        $.post("/functions.jsp", {
            functionName: "login",
            email: $("#email").val(),
            password: $("#password").val()
        }).done(function (data) {
            console.log(data);
            if (data === "\nok")
                window.location.href = "/dashboard.jsp";
            else
                $("#errorDialog").show();
        })
    }
</script>
</body>
</html>

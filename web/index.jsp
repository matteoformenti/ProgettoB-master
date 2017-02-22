<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="progetto.*" %>
<html>
  <head>
      <%=Util.getHeader("Login")%>
  </head>
  <body style="background: url('/img/wallhaven-192170.jpg') no-repeat;background-size: cover">
  <main class="row">
      <div class="col s12 m4 offset-m4" id="errorDialog" style="display: none">
          <div class="card red">
              <div class="card-content">
                <h5 class="white-text center-align center-block">Username o password errati</h5>
              </div>
          </div>
      </div>
      <div class="col s12 m4 offset-m4">
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
  </main>
  <%=Util.getFooter()%>
  <script>
      function attemptLogin() {
          $.post("/functions.jsp", {
              operation: "login",
              email: $("#email").val(),
              password: $("#password").val()
          }).done(function (data) {
              if(data==="false")
                  $("#errorDialog").show();
              else
                  window.location.href = "/dashboard.jps";
          })
      }
  </script>
  </body>
</html>

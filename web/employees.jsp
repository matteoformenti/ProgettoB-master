<%@ page import="progetto.Util" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%=Util.getHeader("Dashboard")%>
</head>
<body class="grey lighten-2">
<%=Util.getTopBar()%>
<div class="container white-text">
    <div class="card">
        <div class="card-content">
            <table>
                <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th style="width: 1px;">Azioni</th>
                </tr>
                </thead>

                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://"+Util.dbIP+":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
                        ResultSet res = con.createStatement().executeQuery("SELECT name, surname, email FROM users;");
                        while (res.next()) {
                %>
                <tr>
                    <td><%= res.getString(1)%></td>
                    <td><%= res.getString(2)%></td>
                    <td><%= res.getString(3)%></td>
                    <td>
                        <i style="cursor: pointer" class="material-icons small" onclick="removeUser('<%= res.getString(3)%>')">delete</i>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="fixed-action-btn vertical">
        <a class="btn-floating btn-large blue waves-effect waves-light" onclick="$('#userModal').modal('open')">
            <i class="large material-icons">add</i>
        </a>
    </div>
    <div class="modal" id="userModal" style="overflow: hidden">
        <form class="modal-content input-field black-text row" id="userForm">
            <h5 class="blue-text col s12"><span id="userLabel"></span></h5>
            <div class="input-field col s12 m6">
                <input type="text" max="20" id="nameInput" placeholder="Nome">
            </div>
            <div class="input-field col s12 m6">
                <input type="text" max="20" id="surnameInput" placeholder="Cognome">
            </div>
            <div class="input-field col s12 m6">
                <input type="email" max="50" id="emailInput" placeholder="email">
            </div>
            <div class="input-field col s12 m6">
                <input type="password" max="20" id="passwordInput" placeholder="Password">
            </div>
        </form>
        <div class="modal-footer right">
            <div class="btn-flat blue-text" onclick="createUser()">Salva</div>
            <div class="btn-flat blue-text" onclick="$('#userModal').modal('close')">Chiudi</div>
        </div>
    </div>
</div>
<%=Util.getFooter()%>
<script>
    $(document).ready(function () {
        $(".modal").modal();
    });

    function removeUser(id) {
        $.post("/functions.jsp", {
            functionName: "removeUser",
            email: id
        }).done(function (data) {
            if (data.includes("ok"))
                reloadUsers();
            else
                Materialize.toast("Errore nella cancellazione dell'utente", 5000);
        });
    }

    function reloadUsers() {
        location.reload();
    }

    function createUser()
    {
        $.post("/functions.jsp", {
            functionName: "addUser",
            name: $("#nameInput").val(),
            surname: $("#surnameInput").val(),
            email: $("#emailInput").val(),
            password: $("#passwordInput").val()
        }).done(function (data) {
            if (data.includes("ok"))
                reloadUsers();
            else
                Materialize.toast("Errore nell'inserimento dell'utente", 5000);
        });
    }
</script>
</body>
</html>

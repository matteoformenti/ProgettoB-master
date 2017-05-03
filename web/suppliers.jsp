<%@ page import="progetto.Util" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
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
                    <th>Indirizzo</th>
                    <th>Referente</th>
                    <th>Email</th>
                    <th style="width: 1px;">Azioni</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://" + Util.dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
                        ResultSet res = con.createStatement().executeQuery("SELECT name, address, referent, email FROM suppliers;");
                        while (res.next()) {
                %>
                <tr>
                    <td><%= res.getString(1)%>
                    </td>
                    <td><%= res.getString(2)%>
                    </td>
                    <td><%= res.getString(3)%>
                    </td>
                    <td><%= res.getString(4)%>
                    </td>
                    <td>
                        <i class="material-icons small" onclick="deleteSupplier('<%= res.getString(1)%>')">delete</i>
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
        <a class="btn-floating btn-large blue waves-effect waves-light" onclick="$('#supplierModal').modal('open')">
            <i class="large material-icons">add</i>
        </a>
    </div>
    <div class="modal" id="supplierModal" style="overflow: hidden">
        <form class="modal-content input-field black-text row" id="userForm">
            <h5 class="blue-text col s12"><span id="userLabel"></span></h5>
            <div class="input-field col s12 m6">
                <input type="text" max="20" id="nameInput" placeholder="Nome">
            </div>
            <div class="input-field col s12 m6">
                <input type="text" max="20" id="referentInput" placeholder="Referente">
            </div>
            <div class="input-field col s12 m6">
                <input type="text" max="50" id="addressInput" placeholder="indirizzo">
            </div>
            <div class="input-field col s12 m6">
                <input type="email" max="20" id="emailInput" placeholder="email">
            </div>
        </form>
        <div class="modal-footer right">
            <div class="btn-flat blue-text" onclick="createSupplier()">Salva</div>
            <div class="btn-flat blue-text" onclick="$('#supplierModal').modal('close')">Chiudi</div>
        </div>
    </div>
</div>
<%=Util.getFooter()%>
<script>
    $(document).ready(function () {
        $(".modal").modal();
    })
    function deleteSupplier(id) {
        $.post("/functions.jsp", {
            functionName: "removeSupplier",
            name: id
        }).done(function (data) {
            if (data.includes("ok"))
                location.reload();
            else
                Materialize.toast("Errore nella cancellazione del fornitore", 5000);
        });
    }

    function createSupplier() {
        $.post("/functions.jsp", {
            functionName: "addSupplier",
            name: $("#nameInput").val(),
            referent: $("#referentInput").val(),
            address: $("#addressInput").val(),
            email: $("#emailInput").val()
        }).done(function (data) {
            if (data.includes("ok"))
                location.reload();
            else
                Materialize.toast("Errore nella creazione del fornitore", 5000);
        });
    }
</script>
</body>
</html>

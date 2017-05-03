<%@ page import="progetto.Util" %><%--
  Created by IntelliJ IDEA.
  User: matteo
  Date: 21/02/17
  Time: 10.50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.isNew()) {
        response.sendRedirect("/login.jsp");
        System.out.println("New session -> redirected");
        System.exit(-1);
    }
%>
<html>
<head>
    <%=Util.getHeader("Dashboard")%>
</head>
<body class="grey lighten-2">
    <%=Util.getTopBar()%>
    <div class="row white-text">
        <div class="col s12">
            <div class="card orange">
                <div class="card-content row">
                    <div class="col s12 m10">
                        <h5 class="white-text no-margin" id="date_time"></h5>
                        <h5 class="white-text no-margin">Ciao <b id="username">USERNAME</b></h5>
                        <h6 class="white-text no-margin light" id="email">matteoformenti1998@gmail.com</h6>
                    </div>
                </div>
            </div>
        </div>

        <div class="col s12 m4">
            <div class="card small blue hoverable" onclick="window.location.href='/employees.jsp'">
                <div class="card-content">
                    <h4>Anagrafica Dipendenti</h4>
                </div>
            </div>
        </div>
        <div class="col s12 m4">
            <div class="card small blue hoverable" onclick="window.location.href='/suppliers.jsp'">
                <div class="card-content">
                    <h4>Anagrafica Fornitori</h4>
                </div>
            </div>
        </div>
        <div class="col s12 m4">
            <div class="card small blue hoverable" onclick="window.location.href='/orders.jsp'">
                <div class="card-content">
                    <h4>Ordini</h4>
                </div>
            </div>
        </div>
    </div>
    <%=Util.getFooter()%>
<script>
    $(document).ready(function () {
        date_time("date_time");
    });

    function date_time(id) {
        var date = new Date;
        var months = new Array('Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre');
        var days = new Array('Domenica', 'Lunedì', 'Martedì', 'Mercoledì', 'Giovedì', 'Venerdì', 'Sabato');
        document.getElementById(id).innerHTML = days[date.getDay()] + ' ' + date.getDate() + ' ' + months[date.getMonth()] + ' ' + date.getFullYear();
    }
</script>
</body>
</html>

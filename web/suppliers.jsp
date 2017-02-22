<%@ page import="progetto.Util" %><%--
  Created by IntelliJ IDEA.
  User: matteo
  Date: 21/02/17
  Time: 10.50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%=Util.getHeader("Dashboard")%>
</head>
<body class="grey lighten-2">
<%=Util.getTopBar()%>
<div class="row white-text">
    <div class="col s12 m4">
        <div class="card small blue darken-4 hoverable">
            <div class="card-content">
                <h4>Anagrafica Dipendenti</h4>
            </div>
        </div>
    </div>
    <div class="col s12 m4">
        <div class="card small blue darken-4 hoverable">
            <div class="card-content">
                <h4>Anagrafica Fornitori</h4>
            </div>
        </div>
    </div>
    <div class="col s12 m4">
        <div class="card small blue darken-4 hoverable">
            <div class="card-content">
                <h4>Ordini</h4>
            </div>
        </div>
    </div>
</div>
<%=Util.getFooter()%>
</body>
</html>

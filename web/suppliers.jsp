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
<div class="container white-text">
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Città</th>
            <th>Provincia</th>
            <th>Via</th>
            <th style="width: 1px;">Azioni</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>001</td>
            <td>Fornitore1</td>
            <td>Monza</td>
            <td>MB</td>
            <td>Via lecco 1</td>
            <td>
                <i class="material-icons small">edit</i>
                <i class="material-icons small">delete</i>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<%=Util.getFooter()%>
</body>
</html>

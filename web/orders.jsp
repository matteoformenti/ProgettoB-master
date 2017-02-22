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
<div class="row">
    <ul class="col s12 m10 offset-m1 collapsible white" data-collapsible="accordion">
        <li>
            <div class="collapsible-header">Ordine <span class="blue-text text-darken-2">001/2017</span></div>
            <div class="collapsible-body">
                <h6>Fornitore: Ciao</h6>
                <h6>Totale: 100€</h6>
                <h6>Data creazione: 2017/02/10</h6>
            </div>
        </li>
        <li>
            <div class="collapsible-header">Ordine <span class="blue-text text-darken-2">002/2017</span></div>
            <div class="collapsible-body">
                <h6>Fornitore: Ciao2</h6>
                <h6>Totale: 250€</h6>
                <h6>Data creazione: 2017/02/11</h6>
            </div>
        </li>
        <li>
            <div class="collapsible-header">Ordine <span class="blue-text text-darken-2">003/2017</span></div>
            <div class="collapsible-body">
                <h6>Fornitore: Ciao</h6>
                <h6>Totale: 47€</h6>
                <h6>Data creazione: 2017/02/12</h6>
            </div>
        </li>
    </ul>
</div>
<%=Util.getFooter()%>
<script>
    $(document).ready(function(){
        $('.collapsible').collapsible();
    });
</script>
</body>
</html>

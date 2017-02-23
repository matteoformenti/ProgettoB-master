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
<div class="container">
    <ul class="collapsible white" data-collapsible="accordion">
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

<div class="modal" id="orderModal">
    <form method="post" id="orderForm">
        <input type="text" readonly hidden value="postOrder" name="functionName">
        <div class="modal-content">
            <div class="row">
                <div class="col s12 m4">
                    <input type="text" placeholder="Nome fornitore" id="supplierName">
                </div>
                <div class="col s12 m4">
                    <input type="date" placeholder="Data ordine" id="orderDate">
                </div>
                <div class="col s12 m4">
                    <input type="text" id="orderID" readonly value="010-2017">
                </div>
            </div>
            <div class="row">
                <table>
                    <thead>
                    <tr>
                        <th>Codice</th>
                        <th>Quantità</th>
                        <th style="width: 1px">Rimuovi</th>
                    </tr>
                    </thead>
                    <tbody id="orderTableBody">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-action right" style="margin: 10px;">
            <div class="btn-flat blue-text waves-effect">Annulla</div>
            <div class="btn-flat blue-text waves-effect" onclick="postOrder()">Salva</div>
        </div>
    </form>
</div>

<%=Util.getFooter()%>
<script>
    var orderTableBody = $("#orderTableBody");
    $(document).ready(function () {
        $('.collapsible').collapsible();
        $(".modal").modal();
        $("#orderModal").modal('open');
        addLine();
        orderTableBody.find(".last").on("keydown", function (a) {
            console.log(a.keyCode);
            if (a.keyCode === 9)
                addLine();
        });
    });

    function addLine() {
        //TODO controllare funzione per listener
        $(".last").removeClass("last");
        orderTableBody.append(`
        <tr>
            <td><input type="text" name="product[]" placeholder="Codice prodotto"></td>
            <td><input type="number" min="0" step="1" name="qty[]" placeholder="Quantità" class="last"></td>
            <td class="center-align"><i class="material-icons tiny" onclick="$(this).closest('tr').remove()">close</i></td>
        </tr>`);
    }

    function postOrder() {
        $("#orderForm").submit();
    }
</script>
</body>
</html>

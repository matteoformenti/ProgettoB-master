<%@ page import="progetto.Util" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
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
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://" + Util.dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
                ResultSet res = con.createStatement().executeQuery("SELECT id, supplier, creationDate, YEAR(creationDate) FROM orders;");
                while (res.next()) {
        %>
        <li>
            <div class="collapsible-header">Ordine <span
                    class="blue-text text-darken-2"><%=res.getString(1) + "-" + res.getString(4)%></span></div>
            <div class="collapsible-body row">
                <div class="col s12 m6">
                    <h6>Fornitore: <%=res.getString(2)%>
                    </h6>
                    <h6>Data creazione: <%=res.getString(3)%>
                    </h6>
                </div>
                <div class="col s12 m6">
                    <%
                        ResultSet orderContent = con.createStatement().executeQuery("SELECT productID, quantity FROM orderContents WHERE orderID = '" + res.getString(1) + "'");
                        while (orderContent.next())
                            out.print("<h6 class='mediumtext'>" + orderContent.getString(1) + ":   <span class='light'>" + orderContent.getString(2) + " pezzi</span></h6>");
                    %>
                </div>
            </div>
        </li>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </ul>
</div>
<style>
    input:not([type]), input[type=text], input[type=password], input[type=email], input[type=url], input[type=time], input[type=date], input[type=datetime], input[type=datetime-local], input[type=tel], input[type=number], input[type=search], textarea.materialize-textarea {
        height: 2rem;
        margin: 0;
    }

    .select-wrapper input.select-dropdown {
        height: 2rem;
    }
</style>
<div class="modal" id="orderModal">
    <form method="post" action="${pageContext.request.contextPath}/functions.jsp" id="orderForm">
        <input type="text" readonly hidden value="submitOrder" name="functionName">
        <div class="modal-content">
            <div class="row">
                <div class="col s12 m4">
                    <select name="supplierName" id="supplierName">
                        <%
                            try {

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://" + Util.dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
                                ResultSet res = null;
                                res = con.createStatement().executeQuery("SELECT name FROM suppliers;");
                                while (res.next()) {
                                    out.println("<option value='" + res.getString(1) + "'>" + res.getString(1) + "</option>");
                                }
                        %>
                    </select>
                </div>
                <div class="col s12 m4">
                    <input type="text" readonly name="creationDate" value="<%
                        res = con.createStatement().executeQuery("SELECT CURDATE()");
                        while (res.next())
                            out.println(res.getString(1));
                    %>">
                </div>
                <div class="col s12 m4">
                    <input type="text" id="orderID" readonly value="<%
                        res = con.createStatement().executeQuery("SELECT IFNULL(MAX(id)+1, 1), YEAR(CURDATE()) FROM orders");
                        while (res.next())
                            out.println(res.getString(1)+"-"+res.getString(2));
                        }catch (SQLException | ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                    %>">
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
                <div onclick="addLine()" class="btn-flat blue-text center-align center-block left"><i
                        class="material-icons left">add</i> Aggiungi riga
                </div>
            </div>
        </div>
        <div class="modal-action right" style="margin: 10px;">
            <div class="btn-flat blue-text waves-effect" onclick="$(this).closest('.modal').modal('close')">Annulla
            </div>
            <div class="btn-flat blue-text waves-effect" onclick="postOrder()">Salva</div>
        </div>
    </form>
</div>

<div class="fixed-action-btn vertical">
    <a class="btn-floating btn-large blue waves-effect waves-light" onclick="$('#orderModal').modal('open')">
        <i class="large material-icons">add</i>
    </a>
</div>

<%=Util.getFooter()%>
<script>
    let orderTableBody = $("#orderTableBody");
    $(document).ready(function () {
        $('.collapsible').collapsible();
        $("select").material_select();
        $(".modal").modal();
        addLine();
    });

    function addLine() {
        orderTableBody.append(`
        <tr>
            <td><input type="text" class="product" placeholder="Codice prodotto"></td>
            <td><input type="number" min="1" step="1" class="qty" placeholder="Quantità" value="1"></td>
            <td class="center-align"><i class="material-icons tiny" onclick="$(this).closest('tr').remove()">close</i></td>
        </tr>`);
    }

    function postOrder() {
        let products = $(document).find(".product");
        let quantities = $(document).find(".qty");
        data = "";
        for (let i = 0; i < products.length; i++) {
            if ($(products[i]).val()==="" || $(quantities[i]).val()==="")
            {
                Materialize.toast("Errore nella riga "+(i+1)+" dell'ordine!", 5000);
                return;
            }
            data += $(products[i]).val() + ":" + $(quantities[i]).val() + ",";
        }
        $.post("/functions.jsp", {
            functionName: "submitOrder",
            data: data,
            supplier: $("#supplierName").val()
        }).done(function (dataIn) {
            console.log(dataIn);
            if (dataIn.includes("ok"))
                window.location.reload();
            else
                Materialize.toast("Errore nel caricamento dell'orine", 5000);
        });
    }
</script>
</body>
</html>

<%@ page import="progetto.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.isNew()) {
        out.print("error");
        System.exit(-1);
    }

    switch (request.getParameter("functionName")) {
        case "login":
            if (Util.checkLogin(request.getParameter("email"), request.getParameter("password")))
                out.print("ok");
            else
                out.print("error");
            break;
        case "addUser":
            if (Util.addUser(request.getParameter("name"), request.getParameter("surname"), request.getParameter("email"), request.getParameter("password")))
                out.print("ok");
            else
                out.print("error");
            break;
        case "removeUser":
            if (Util.removeUser(request.getParameter("email")))
                out.print("ok");
            else
                out.print("error");
            break;
        case "removeSupplier":
            if (Util.removeSupplier(request.getParameter("name")))
                out.print("ok");
            else
                out.print("error");
            break;
        case "addSupplier":
            if (Util.addSupplier(request.getParameter("name"), request.getParameter("referent"), request.getParameter("address"), request.getParameter("email")))
                out.print("ok");
            else
                out.print("error");
            break;
        case "submitOrder":
            if (Util.submitOrder(request.getParameter("supplier"), request.getParameter("data")))
                out.println("ok");
            else
                out.println("error");
            break;
    }
%>
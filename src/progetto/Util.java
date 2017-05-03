package progetto;

import java.sql.*;
import java.util.Arrays;

public class Util {
    public static String dbIP = "192.168.0.49";

    public static String getHeader(String title) {
        String header = "<link rel='stylesheet' href='/res/materialize.min.css'>\n";
        header += "<link href='/res/icons.css' rel='stylesheet'>\n";
        header += "<meta name='viewport' content='width=device-width, initial-scale=1.0'/>\n";
        header += "<title>" + title + "</title>";
        return header;
    }

    public static String getTopBar() {
        return "<nav>\n" +
                "    <div class=\"nav-wrapper blue-grey darken-3\">\n" +
                "        <a href=\"/dashboard.jsp\" class=\"brand-logo light\">WEB orders</a>\n" +
                "        <ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">\n" +
                "            <li><a class='dropdown-button btn-flat white-text' href='#'>Logout</a></li>\n" +
                "        </ul>\n" +
                "    </div>\n" +
                "</nav>";
    }

    public static String getFooter() {
        String footer = "<script type='text/javascript' src='/res/jquery-3.1.1.min.js'></script>\n";
        footer += "<script src='/res/materialize.min.js'></script>\n";
        return footer;
    }

    public static boolean addUser(String name, String surname, String email, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
            return !con.createStatement().execute("INSERT INTO users VALUES ('" + email + "', '" + password + "', '" + name + "', '" + surname + "')");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean removeUser(String email) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
            return !con.createStatement().execute("DELETE FROM users WHERE email = '" + email + "'");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean edit() {
        return true;
    }

    public static boolean checkLogin(String email, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
            ResultSet res = con.createStatement().executeQuery("SELECT COUNT(*) as tot FROM users WHERE email = '" + email + "' AND password = '" + password + "';");
            res.next();
            return res.getInt(1) == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean removeSupplier(String name) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
            return !con.createStatement().execute("DELETE FROM suppliers WHERE name = '" + name + "'");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean addSupplier(String name, String referent, String address, String email) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
            return !con.createStatement().execute("INSERT INTO suppliers VALUES ('" + name + "', '" + referent + "', '" + address + "', '" + email + "')");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean submitOrder(String supplier, String data) {
        try {
            String[] products = data.split(",");
            if (products.length == 0)
                return false;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + dbIP + ":3306/progB?autoReconnect=true&useSSL=false", "omega", "Task634Keep");
            PreparedStatement ps = con.prepareStatement("INSERT INTO orders (status, supplier, user, creationDate)  VALUES (0, '" + supplier + "', 'admin@admin.com', CURDATE())", Statement.RETURN_GENERATED_KEYS);
            System.out.println("INSERT INTO orders (status, supplier, user, creationDate)  VALUES (0, '" + supplier + "', 'admin@admin.com', CURDATE())");
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            int orderID = 0;
            if (rs.next())
                orderID = rs.getInt(1);
            for (String product : products) {
                if (!product.split(":")[0].equals(""))
                    con.createStatement().execute("INSERT INTO orderContents VALUES ('" + orderID + "', '" + product.split(":")[0] + "', '" + product.split(":")[1] + "')");
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

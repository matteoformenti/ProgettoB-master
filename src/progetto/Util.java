package progetto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Util {
    public static String getHeader(String title) {
        String header = "<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css'>\n";
        header += "<link href='http://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>\n";
        header += "<meta name='viewport' content='width=device-width, initial-scale=1.0'/>\n";
        header += "<title>" + title + "</title>";
        return header;
    }

    public static String getTopBar() {
        return "<nav>\n" +
                "    <div class=\"nav-wrapper blue darken-4\">\n" +
                "        <a href=\"/dashboard.jsp\" class=\"brand-logo light\">WEB orders</a>\n" +
                "        <ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">\n" +
                "            <li><a class='dropdown-button btn-flat white-text' href='#'>Logout</a></li>\n" +
                "        </ul>\n" +
                "    </div>\n" +
                "</nav>";
    }

    public static String getFooter() {
        String footer = "<script type='text/javascript' src='https://code.jquery.com/jquery-3.1.1.min.js'></script>\n";
        footer += "<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js'></script>\n";
        return footer;
    }

    static void checkLogin(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://10.0.0.112:3306/progB?autoReconnect=true&useSSL=false", username, password);
            ResultSet res = con.createStatement().executeQuery("SELECT * FROM users");
            //return res.getString(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

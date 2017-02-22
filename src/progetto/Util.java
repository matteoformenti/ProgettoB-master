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
        return "<nav><div class='nav-wrapper blue'>\n" +
                "      <a href='/dashboard.jsp' class='brand-logo' style='padding-left:10px'>WEBOrdini</a>\n" +
                "      <ul class='right hide-on-med-and-down'>\n" +
                "        <li><div onclick='alert(\"CIAO\")><i class='material-icons left'>hamburger</i>Link with Left Icon</div></li>\n" +
                "      </ul>\n" +
                "    </div></nav>";
    }

    public static String getFooter() {
        String footer = "<script type='text/javascript' src='https://code.jquery.com/jquery-3.1.1.min.js'></script>\n";
        footer += "<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js'></script>\n";
        return footer;
    }

    public static String checkLogin(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://10.0.0.112:3306/progB?autoReconnect=true&useSSL=false", "root", "Task634Keep");
            ResultSet res = con.createStatement().executeQuery("SELECT * FROM users");
            return("Success");
            //return res.getString(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

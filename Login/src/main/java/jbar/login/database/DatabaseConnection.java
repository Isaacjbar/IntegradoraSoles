package jbar.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://db-historiainteractiva.chutbwctkgaj.us-east-1.rds.amazonaws.com:3306/historiaInteractiva";
    private static final String USER = "IsaacJbar";
    private static final String PASSWORD = "deol_bcl#18";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

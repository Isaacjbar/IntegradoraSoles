package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Escena;
import jbar.login.model.EscenaPrueba;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EscenaDaoPrueba {
    // Este método dao es para crear una escena con una imagen sólamente, se tienen que hacer más funciones para las
    // diferentes combinaciones
    public boolean crearEscenaCombinacion1(EscenaPrueba escena) {
        String sql = "INSERT INTO escenaPruebaErick (titulo, descripcion,imagen)" +
                "VALUES (?,?,?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, escena.getTitulo());
            statement.setString(2, escena.getDescripcion());
            statement.setString(3, escena.getImagen());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

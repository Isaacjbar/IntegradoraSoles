package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDao {

    public Usuario getUsuarioByCredenciales(String nombreUsuario, String contrasena) {
        // Implementación existente
        return null;
    }

    public boolean insertUsuario(Usuario usuario) {
        String sql = "INSERT INTO Usuarios (Nombre, Apellido, CorreoElectronico, Contraseña, estado, FechaRegistro) VALUES (?, ?, ?, SHA2(?, 256), ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getCorreoElectronico());
            statement.setString(4, usuario.getContrasena());
            statement.setBoolean(5, usuario.isEstado());
            statement.setTimestamp(6, usuario.getFechaRegistro());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Asegúrate de devolver false en caso de excepción
        }
    }
}

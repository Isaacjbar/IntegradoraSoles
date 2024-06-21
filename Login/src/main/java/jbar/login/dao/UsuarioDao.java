package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDao {

    public Usuario getUsuarioByCredenciales(String nombreUsuario, String contrasena) {
        Usuario usuario = null;
        String sql = "SELECT * FROM Usuarios WHERE (Nombre = ? OR CorreoElectronico = ?) AND Contraseña = SHA2(?, 256)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, nombreUsuario);
            statement.setString(2, nombreUsuario);
            statement.setString(3, contrasena);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("ID"));
                usuario.setNombre(resultSet.getString("Nombre"));
                usuario.setApellido(resultSet.getString("Apellido"));
                usuario.setFechaNacimiento(resultSet.getDate("FechaNacimiento"));
                usuario.setCorreoElectronico(resultSet.getString("CorreoElectronico"));
                usuario.setContrasena(resultSet.getString("Contraseña"));
                usuario.setEstado(resultSet.getBoolean("estado"));
                usuario.setCodigo(resultSet.getString("codigo"));
                usuario.setFechaRegistro(resultSet.getTimestamp("FechaRegistro"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public boolean insertUsuario(Usuario usuario) {
        String sql = "INSERT INTO Usuarios (Nombre, Apellido, FechaNacimiento, CorreoElectronico, Contraseña, estado, FechaRegistro) " +
                "VALUES (?, ?, ?, SHA2(?, 256), ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setDate(3, new java.sql.Date(usuario.getFechaNacimiento().getTime())); // Aquí usamos java.sql.Date
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

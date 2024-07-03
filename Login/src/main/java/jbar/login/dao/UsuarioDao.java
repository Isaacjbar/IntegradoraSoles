package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        String sql = "INSERT INTO Usuarios (Nombre, Apellido, CorreoElectronico, Contraseña, estado, FechaRegistro) " +
                "VALUES (?, ?, ?, SHA2(?, 256), ?, ?)";

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
            return false;
        }
    }

    public Usuario getUsuarioById(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM Usuarios WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("ID"));
                usuario.setNombre(resultSet.getString("Nombre"));
                usuario.setApellido(resultSet.getString("Apellido"));
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

    public List<Usuario> getAllUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM Usuarios";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(resultSet.getInt("ID"));
                usuario.setNombre(resultSet.getString("Nombre"));
                usuario.setApellido(resultSet.getString("Apellido"));
                usuario.setCorreoElectronico(resultSet.getString("CorreoElectronico"));
                usuario.setContrasena(resultSet.getString("Contraseña"));
                usuario.setEstado(resultSet.getBoolean("estado"));
                usuario.setCodigo(resultSet.getString("codigo"));
                usuario.setFechaRegistro(resultSet.getTimestamp("FechaRegistro"));
                usuarios.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarios;
    }

    public boolean updateUsuario(Usuario usuario) {
        String sql = "UPDATE Usuarios SET Nombre = ?, Apellido = ?, CorreoElectronico = ?, Contraseña = SHA2(?, 256), estado = ?, codigo = ? WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getCorreoElectronico());
            statement.setString(4, usuario.getContrasena());
            statement.setBoolean(5, usuario.isEstado());
            statement.setString(6, usuario.getCodigo());
            statement.setInt(7, usuario.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUsuario(int id) {
        String sql = "DELETE FROM Usuarios WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

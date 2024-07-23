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
        String sql = "SELECT * FROM usuario WHERE (nombre = ? OR correo_electronico = ?) AND contrasena = SHA2(?, 256)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, nombreUsuario);
            statement.setString(2, nombreUsuario);
            statement.setString(3, contrasena);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setApellido(resultSet.getString("apellido"));
                usuario.setCorreoElectronico(resultSet.getString("correo_electronico"));
                usuario.setContrasena(resultSet.getString("contrasena"));
                usuario.setEstado(resultSet.getBoolean("estado"));
                usuario.setCodigo(resultSet.getString("codigo"));
                usuario.setCategoria(resultSet.getString("categoria"));
                usuario.setFechaRegistro(resultSet.getTimestamp("fecha_registro"));
                usuario.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public boolean insertUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombre, apellido, correo_electronico, contrasena, estado, codigo, categoria, fecha_registro, fecha_creacion) " +
                "VALUES (?, ?, ?, SHA2(?, 256), ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getCorreoElectronico());
            statement.setString(4, usuario.getContrasena());
            statement.setBoolean(5, usuario.isEstado());
            statement.setString(6, usuario.getCodigo());
            statement.setString(7, usuario.getCategoria());
            statement.setTimestamp(8, usuario.getFechaRegistro());
            statement.setTimestamp(9, usuario.getFechaCreacion());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Usuario getUsuarioById(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setApellido(resultSet.getString("apellido"));
                usuario.setCorreoElectronico(resultSet.getString("correo_electronico"));
                usuario.setContrasena(resultSet.getString("contrasena"));
                usuario.setEstado(resultSet.getBoolean("estado"));
                usuario.setCodigo(resultSet.getString("codigo"));
                usuario.setCategoria(resultSet.getString("categoria"));
                usuario.setFechaRegistro(resultSet.getTimestamp("fecha_registro"));
                usuario.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public List<Usuario> getAllUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setApellido(resultSet.getString("apellido"));
                usuario.setCorreoElectronico(resultSet.getString("correo_electronico"));
                usuario.setContrasena(resultSet.getString("contrasena"));
                usuario.setEstado(resultSet.getBoolean("estado"));
                usuario.setCodigo(resultSet.getString("codigo"));
                usuario.setCategoria(resultSet.getString("categoria"));
                usuario.setFechaRegistro(resultSet.getTimestamp("fecha_registro"));
                usuario.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                usuarios.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarios;
    }

    public boolean updateUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, correo_electronico = ?, contrasena = SHA2(?, 256), estado = ?, codigo = ?, categoria = ?, fecha_creacion = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getCorreoElectronico());
            statement.setString(4, usuario.getContrasena());
            statement.setBoolean(5, usuario.isEstado());
            statement.setString(6, usuario.getCodigo());
            statement.setString(7, usuario.getCategoria());
            statement.setTimestamp(8, usuario.getFechaCreacion());
            statement.setInt(9, usuario.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUsuario(int id) {
        String sql = "DELETE FROM usuario WHERE id = ?";

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

    public boolean updateWithEmail(String email, String codigoRecuperacion){
        boolean flag = false;
        String query = "UPDATE usuario SET codigo = ? WHERE correo_electronico = ?";
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, codigoRecuperacion);
            ps.setString(2, email);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Usuario getOne(int id) {
        Usuario usuario = new Usuario();
        String query = "SELECT * FROM usuario WHERE id = ?";

        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setCorreoElectronico(rs.getString("correo_electronico"));
                usuario.setCodigo(rs.getString("codigo"));
                usuario.setEstado(rs.getBoolean("estado"));
                usuario.setFechaRegistro(rs.getTimestamp("fecha_registro"));
                usuario.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                usuario.setCategoria(rs.getString("categoria"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Boolean getOne(String correo) {
        Boolean flag = false;
        String query = "SELECT * FROM usuario WHERE correo_electronico = ?";

        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, correo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Boolean codeExist(String codigo) {
        Boolean flag = false;
        String query = "SELECT * FROM usuario WHERE codigo = ?";

        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, codigo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updatePassword(String codigo, String nuevaContrasena) {
        boolean flag = false;
        String query = "UPDATE usuario SET contrasena = SHA2(?, 256), codigo = null WHERE codigo = ?";
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nuevaContrasena);
            ps.setString(2, codigo);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Usuario getUsuarioByCorreo(String correo) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE correo_electronico = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, correo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setId(rs.getInt("id"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setCorreoElectronico(rs.getString("correo_electronico"));
                    usuario.setContrasena(rs.getString("contrasena"));
                    usuario.setEstado(rs.getBoolean("estado"));
                    usuario.setCategoria(rs.getString("categoria"));
                    usuario.setFechaRegistro(rs.getTimestamp("fecha_registro"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

}

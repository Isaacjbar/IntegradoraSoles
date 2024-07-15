package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Portada;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PortadaDao {

    public boolean insertPortada(Portada portada) {
        String sql = "INSERT INTO portada (historia_id, titulo, video, audio, imagen, descripcion, fecha_creacion) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, portada.getHistoriaId());
            statement.setString(2, portada.getTitulo());
            statement.setString(3, portada.getVideo());
            statement.setString(4, portada.getAudio());
            statement.setString(5, portada.getImagen());
            statement.setString(6, portada.getDescripcion());
            statement.setTimestamp(7, portada.getFechaCreacion());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Portada getPortadaById(int id) {
        Portada portada = null;
        String sql = "SELECT * FROM portada WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                portada = new Portada();
                portada.setId(resultSet.getInt("id"));
                portada.setHistoriaId(resultSet.getInt("historia_id"));
                portada.setTitulo(resultSet.getString("titulo"));
                portada.setVideo(resultSet.getString("video"));
                portada.setAudio(resultSet.getString("audio"));
                portada.setImagen(resultSet.getString("imagen"));
                portada.setDescripcion(resultSet.getString("descripcion"));
                portada.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return portada;
    }

    public List<Portada> getAllPortadasByUsuarioId(int usuarioId) {
        List<Portada> portadas = new ArrayList<>();
        String sql = "SELECT p.* FROM portada p JOIN historia h ON p.historia_id = h.id WHERE h.autor_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, usuarioId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Portada portada = new Portada();
                portada.setId(resultSet.getInt("id"));
                portada.setHistoriaId(resultSet.getInt("historia_id"));
                portada.setTitulo(resultSet.getString("titulo"));
                portada.setVideo(resultSet.getString("video"));
                portada.setAudio(resultSet.getString("audio"));
                portada.setImagen(resultSet.getString("imagen"));
                portada.setDescripcion(resultSet.getString("descripcion"));
                portada.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                portadas.add(portada);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return portadas;
    }

    public boolean updatePortada(Portada portada) {
        String sql = "UPDATE portada SET historia_id = ?, titulo = ?, video = ?, audio = ?, imagen = ?, " +
                "descripcion = ?, fecha_creacion = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, portada.getHistoriaId());
            statement.setString(2, portada.getTitulo());
            statement.setString(3, portada.getVideo());
            statement.setString(4, portada.getAudio());
            statement.setString(5, portada.getImagen());
            statement.setString(6, portada.getDescripcion());
            statement.setTimestamp(7, portada.getFechaCreacion());
            statement.setInt(8, portada.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePortada(int id) {
        String sql = "DELETE FROM portada WHERE id = ?";

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

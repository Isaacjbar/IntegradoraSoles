package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Historia;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HistoriaDao {

    public boolean insertHistoria(Historia historia) {
        String sql = "INSERT INTO historia (titulo, autor_id, multimedia, descripcion, fecha_creacion) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, historia.getTitulo());
            statement.setInt(2, historia.getAutorId());
            statement.setString(3, historia.getMultimedia());
            statement.setString(4, historia.getDescripcion());
            statement.setTimestamp(5, historia.getFechaCreacion());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Historia getHistoriaById(int id) {
        Historia historia = null;
        String sql = "SELECT * FROM historia WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                historia = new Historia();
                historia.setId(resultSet.getInt("id"));
                historia.setTitulo(resultSet.getString("titulo"));
                historia.setAutorId(resultSet.getInt("autor_id"));
                historia.setMultimedia(resultSet.getString("multimedia"));
                historia.setDescripcion(resultSet.getString("descripcion"));
                historia.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historia;
    }

    public List<Historia> getAllHistorias() {
        List<Historia> historias = new ArrayList<>();
        String sql = "SELECT * FROM historia";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Historia historia = new Historia();
                historia.setId(resultSet.getInt("id"));
                historia.setTitulo(resultSet.getString("titulo"));
                historia.setAutorId(resultSet.getInt("autor_id"));
                historia.setMultimedia(resultSet.getString("multimedia"));
                historia.setDescripcion(resultSet.getString("descripcion"));
                historia.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                historias.add(historia);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historias;
    }

    public boolean updateHistoria(Historia historia) {
        String sql = "UPDATE historia SET titulo = ?, autor_id = ?, multimedia = ?, descripcion = ?, fecha_creacion = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, historia.getTitulo());
            statement.setInt(2, historia.getAutorId());
            statement.setString(3, historia.getMultimedia());
            statement.setString(4, historia.getDescripcion());
            statement.setTimestamp(5, historia.getFechaCreacion());
            statement.setInt(6, historia.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHistoria(int id) {
        String sql = "DELETE FROM historia WHERE id = ?";

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

    public int getLastHistoriaId() {
        String sql = "SELECT MAX(id) AS max_id FROM historia";
        int lastId = -1;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                lastId = resultSet.getInt("max_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lastId;
    }
    public List<Historia> getAllHistoriasByUsuarioId(int usuarioId) {
        List<Historia> historias = new ArrayList<>();
        String sql = "SELECT * FROM historia WHERE autor_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, usuarioId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Historia historia = new Historia();
                historia.setId(resultSet.getInt("id"));
                historia.setTitulo(resultSet.getString("titulo"));
                historia.setAutorId(resultSet.getInt("autor_id"));
                historia.setMultimedia(resultSet.getString("multimedia"));
                historia.setDescripcion(resultSet.getString("descripcion"));
                historia.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                historias.add(historia);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historias;
    }
}

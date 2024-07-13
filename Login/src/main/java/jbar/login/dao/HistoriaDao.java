package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Historia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistoriaDao {

    public boolean insertHistoria(Historia historia) {
        String sql = "INSERT INTO historia (titulo, autor_id, fecha_creacion) VALUES (?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, historia.getTitulo());
            statement.setInt(2, historia.getAutorId());
            statement.setTimestamp(3, historia.getFechaCreacion());

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
                historia.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                historias.add(historia);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historias;
    }

    public boolean updateHistoria(Historia historia) {
        String sql = "UPDATE historia SET titulo = ?, autor_id = ?, fecha_creacion = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, historia.getTitulo());
            statement.setInt(2, historia.getAutorId());
            statement.setTimestamp(3, historia.getFechaCreacion());
            statement.setInt(4, historia.getId());

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
}

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
        String sql = "INSERT INTO Historias (Titulo, AutorID) VALUES (?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, historia.getTitulo());
            statement.setInt(2, historia.getAutorId());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Historia getHistoriaById(int id) {
        Historia historia = null;
        String sql = "SELECT * FROM Historias WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                historia = new Historia();
                historia.setId(resultSet.getInt("ID"));
                historia.setTitulo(resultSet.getString("Titulo"));
                historia.setAutorId(resultSet.getInt("AutorID"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historia;
    }

    public List<Historia> getAllHistorias() {
        List<Historia> historias = new ArrayList<>();
        String sql = "SELECT * FROM Historias";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Historia historia = new Historia();
                historia.setId(resultSet.getInt("ID"));
                historia.setTitulo(resultSet.getString("Titulo"));
                historia.setAutorId(resultSet.getInt("AutorID"));
                historias.add(historia);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historias;
    }

    public boolean updateHistoria(Historia historia) {
        String sql = "UPDATE Historias SET Titulo = ?, AutorID = ? WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, historia.getTitulo());
            statement.setInt(2, historia.getAutorId());
            statement.setInt(3, historia.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHistoria(int id) {
        String sql = "DELETE FROM Historias WHERE ID = ?";

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

package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Decision;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DecisionDao {

    public boolean insertDecision(Decision decision) {
        String sql = "INSERT INTO Decisiones (EscenaID, Descripcion, EscenaDestinoID) VALUES (?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, decision.getEscenaId());
            statement.setString(2, decision.getDescripcion());
            statement.setInt(3, decision.getEscenaDestinoId());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Decision getDecisionById(int id) {
        Decision decision = null;
        String sql = "SELECT * FROM Decisiones WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                decision = new Decision();
                decision.setId(resultSet.getInt("ID"));
                decision.setEscenaId(resultSet.getInt("EscenaID"));
                decision.setDescripcion(resultSet.getString("Descripcion"));
                decision.setEscenaDestinoId(resultSet.getInt("EscenaDestinoID"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return decision;
    }

    public List<Decision> getAllDecisiones() {
        List<Decision> decisiones = new ArrayList<>();
        String sql = "SELECT * FROM Decisiones";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Decision decision = new Decision();
                decision.setId(resultSet.getInt("ID"));
                decision.setEscenaId(resultSet.getInt("EscenaID"));
                decision.setDescripcion(resultSet.getString("Descripcion"));
                decision.setEscenaDestinoId(resultSet.getInt("EscenaDestinoID"));
                decisiones.add(decision);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return decisiones;
    }

    public boolean updateDecision(Decision decision) {
        String sql = "UPDATE Decisiones SET EscenaID = ?, Descripcion = ?, EscenaDestinoID = ? WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, decision.getEscenaId());
            statement.setString(2, decision.getDescripcion());
            statement.setInt(3, decision.getEscenaDestinoId());
            statement.setInt(4, decision.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteDecision(int id) {
        String sql = "DELETE FROM Decisiones WHERE ID = ?";

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

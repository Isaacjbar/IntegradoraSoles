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
        String sql = "INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, decision.getEscenaId());
            statement.setString(2, decision.getDescripcion());
            statement.setInt(3, decision.getEscenaDestinoId());
            statement.setTimestamp(4, decision.getFechaCreacion());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Decision getDecisionById(int id) {
        Decision decision = null;
        String sql = "SELECT * FROM decision WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                decision = new Decision();
                decision.setId(resultSet.getInt("id"));
                decision.setEscenaId(resultSet.getInt("escena_id"));
                decision.setDescripcion(resultSet.getString("descripcion"));
                decision.setEscenaDestinoId(resultSet.getInt("escena_destino_id"));
                decision.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return decision;
    }

    public List<Decision> getAllDecisiones() {
        List<Decision> decisiones = new ArrayList<>();
        String sql = "SELECT * FROM decision";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Decision decision = new Decision();
                decision.setId(resultSet.getInt("id"));
                decision.setEscenaId(resultSet.getInt("escena_id"));
                decision.setDescripcion(resultSet.getString("descripcion"));
                decision.setEscenaDestinoId(resultSet.getInt("escena_destino_id"));
                decision.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                decisiones.add(decision);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return decisiones;
    }

    public boolean updateDecision(Decision decision) {
        String sql = "UPDATE decision SET escena_id = ?, descripcion = ?, escena_destino_id = ?, fecha_creacion = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, decision.getEscenaId());
            statement.setString(2, decision.getDescripcion());
            statement.setInt(3, decision.getEscenaDestinoId());
            statement.setTimestamp(4, decision.getFechaCreacion());
            statement.setInt(5, decision.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteDecision(int id) {
        String sql = "DELETE FROM decision WHERE id = ?";

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
    public List<Decision> getDecisionesByEscenaId(int escenaId) {
        List<Decision> decisiones = new ArrayList<>();
        String sql = "SELECT * FROM decision WHERE escena_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, escenaId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Decision decision = new Decision();
                decision.setId(resultSet.getInt("id"));
                decision.setEscenaId(resultSet.getInt("escena_id"));
                decision.setDescripcion(resultSet.getString("descripcion"));
                decision.setEscenaDestinoId(resultSet.getInt("escena_destino_id"));
                decision.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                decisiones.add(decision);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return decisiones;
    }
}
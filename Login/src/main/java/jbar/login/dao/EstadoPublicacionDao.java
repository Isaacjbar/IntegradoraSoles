package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.EstadoPublicacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstadoPublicacionDao {

    public boolean insertEstadoPublicacion(EstadoPublicacion estadoPublicacion) {
        String sql = "INSERT INTO EstadosPublicacion (HistoriaID, Estado, FechaCambio) VALUES (?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, estadoPublicacion.getHistoriaId());
            statement.setString(2, estadoPublicacion.getEstado());
            statement.setTimestamp(3, estadoPublicacion.getFechaCambio());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public EstadoPublicacion getEstadoPublicacionById(int id) {
        EstadoPublicacion estadoPublicacion = null;
        String sql = "SELECT * FROM EstadosPublicacion WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                estadoPublicacion = new EstadoPublicacion();
                estadoPublicacion.setId(resultSet.getInt("ID"));
                estadoPublicacion.setHistoriaId(resultSet.getInt("HistoriaID"));
                estadoPublicacion.setEstado(resultSet.getString("Estado"));
                estadoPublicacion.setFechaCambio(resultSet.getTimestamp("FechaCambio"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return estadoPublicacion;
    }

    public List<EstadoPublicacion> getAllEstadosPublicacion() {
        List<EstadoPublicacion> estadosPublicacion = new ArrayList<>();
        String sql = "SELECT * FROM EstadosPublicacion";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                EstadoPublicacion estadoPublicacion = new EstadoPublicacion();
                estadoPublicacion.setId(resultSet.getInt("ID"));
                estadoPublicacion.setHistoriaId(resultSet.getInt("HistoriaID"));
                estadoPublicacion.setEstado(resultSet.getString("Estado"));
                estadoPublicacion.setFechaCambio(resultSet.getTimestamp("FechaCambio"));
                estadosPublicacion.add(estadoPublicacion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return estadosPublicacion;
    }

    public boolean updateEstadoPublicacion(EstadoPublicacion estadoPublicacion) {
        String sql = "UPDATE EstadosPublicacion SET HistoriaID = ?, Estado = ?, FechaCambio = ? WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, estadoPublicacion.getHistoriaId());
            statement.setString(2, estadoPublicacion.getEstado());
            statement.setTimestamp(3, estadoPublicacion.getFechaCambio());
            statement.setInt(4, estadoPublicacion.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteEstadoPublicacion(int id) {
        String sql = "DELETE FROM EstadosPublicacion WHERE ID = ?";

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

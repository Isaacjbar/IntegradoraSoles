package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Escena;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EscenaDao {

    public boolean insertEscena(Escena escena) {
        String sql = "INSERT INTO Escenas (HistoriaID, NumeroEscena, Titulo, Video, Audio, Imagen, EsFinal) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, escena.getHistoriaId());
            statement.setInt(2, escena.getNumeroEscena());
            statement.setString(3, escena.getTitulo());
            statement.setBytes(4, escena.getVideo());
            statement.setBytes(5, escena.getAudio());
            statement.setBytes(6, escena.getImagen());
            statement.setBoolean(7, escena.isEsFinal());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Escena getEscenaById(int id) {
        Escena escena = null;
        String sql = "SELECT * FROM Escenas WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                escena = new Escena();
                escena.setId(resultSet.getInt("ID"));
                escena.setHistoriaId(resultSet.getInt("HistoriaID"));
                escena.setNumeroEscena(resultSet.getInt("NumeroEscena"));
                escena.setTitulo(resultSet.getString("Titulo"));
                escena.setVideo(resultSet.getBytes("Video"));
                escena.setAudio(resultSet.getBytes("Audio"));
                escena.setImagen(resultSet.getBytes("Imagen"));
                escena.setEsFinal(resultSet.getBoolean("EsFinal"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return escena;
    }
}

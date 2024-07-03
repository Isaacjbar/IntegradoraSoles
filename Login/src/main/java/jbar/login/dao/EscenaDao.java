package jbar.login.dao;

import jbar.login.database.DatabaseConnection;
import jbar.login.model.Escena;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EscenaDao {

    public boolean insertEscena(Escena escena) {
        String sql = "INSERT INTO Escenas (HistoriaID, Titulo, Video, Audio, Imagen, Descripcion, EsFinal, TextoFinal) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, escena.getHistoriaId());
            statement.setString(2, escena.getTitulo());
            statement.setString(3, escena.getVideo());
            statement.setBytes(4, escena.getAudio());
            statement.setBytes(5, escena.getImagen());
            statement.setString(6, escena.getDescripcion());
            statement.setBoolean(7, escena.isEsFinal());
            statement.setString(8, escena.getTextoFinal());

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
                escena.setTitulo(resultSet.getString("Titulo"));
                escena.setVideo(resultSet.getString("Video"));
                escena.setAudio(resultSet.getBytes("Audio"));
                escena.setImagen(resultSet.getBytes("Imagen"));
                escena.setDescripcion(resultSet.getString("Descripcion"));
                escena.setEsFinal(resultSet.getBoolean("EsFinal"));
                escena.setTextoFinal(resultSet.getString("TextoFinal"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return escena;
    }

    public List<Escena> getAllEscenas() {
        List<Escena> escenas = new ArrayList<>();
        String sql = "SELECT * FROM Escenas";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Escena escena = new Escena();
                escena.setId(resultSet.getInt("ID"));
                escena.setHistoriaId(resultSet.getInt("HistoriaID"));
                escena.setTitulo(resultSet.getString("Titulo"));
                escena.setVideo(resultSet.getString("Video"));
                escena.setAudio(resultSet.getBytes("Audio"));
                escena.setImagen(resultSet.getBytes("Imagen"));
                escena.setDescripcion(resultSet.getString("Descripcion"));
                escena.setEsFinal(resultSet.getBoolean("EsFinal"));
                escena.setTextoFinal(resultSet.getString("TextoFinal"));
                escenas.add(escena);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return escenas;
    }

    public boolean updateEscena(Escena escena) {
        String sql = "UPDATE Escenas SET HistoriaID = ?, Titulo = ?, Video = ?, Audio = ?, Imagen = ?, " +
                "Descripcion = ?, EsFinal = ?, TextoFinal = ? WHERE ID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, escena.getHistoriaId());
            statement.setString(2, escena.getTitulo());
            statement.setString(3, escena.getVideo());
            statement.setBytes(4, escena.getAudio());
            statement.setBytes(5, escena.getImagen());
            statement.setString(6, escena.getDescripcion());
            statement.setBoolean(7, escena.isEsFinal());
            statement.setString(8, escena.getTextoFinal());
            statement.setInt(9, escena.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteEscena(int id) {
        String sql = "DELETE FROM Escenas WHERE ID = ?";

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

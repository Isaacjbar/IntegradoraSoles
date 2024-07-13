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
        String sql = "INSERT INTO escena (historia_id, titulo, video, audio, imagen, descripcion, es_final, texto_final, fecha_creacion) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, escena.getHistoriaId());
            statement.setString(2, escena.getTitulo());
            statement.setString(3, escena.getVideo());
            statement.setString(4, escena.getAudio());
            statement.setString(5, escena.getImagen());
            statement.setString(6, escena.getDescripcion());
            statement.setBoolean(7, escena.isEsFinal());
            statement.setString(8, escena.getTextoFinal());
            statement.setTimestamp(9, escena.getFechaCreacion());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Escena getEscenaById(int id) {
        Escena escena = null;
        String sql = "SELECT * FROM escena WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                escena = new Escena();
                escena.setId(resultSet.getInt("id"));
                escena.setHistoriaId(resultSet.getInt("historia_id"));
                escena.setTitulo(resultSet.getString("titulo"));
                escena.setVideo(resultSet.getString("video"));
                escena.setAudio(resultSet.getString("audio"));
                escena.setImagen(resultSet.getString("imagen"));
                escena.setDescripcion(resultSet.getString("descripcion"));
                escena.setEsFinal(resultSet.getBoolean("es_final"));
                escena.setTextoFinal(resultSet.getString("texto_final"));
                escena.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return escena;
    }

    public List<Escena> getAllEscenas() {
        List<Escena> escenas = new ArrayList<>();
        String sql = "SELECT * FROM escena";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Escena escena = new Escena();
                escena.setId(resultSet.getInt("id"));
                escena.setHistoriaId(resultSet.getInt("historia_id"));
                escena.setTitulo(resultSet.getString("titulo"));
                escena.setVideo(resultSet.getString("video"));
                escena.setAudio(resultSet.getString("audio"));
                escena.setImagen(resultSet.getString("imagen"));
                escena.setDescripcion(resultSet.getString("descripcion"));
                escena.setEsFinal(resultSet.getBoolean("es_final"));
                escena.setTextoFinal(resultSet.getString("texto_final"));
                escena.setFechaCreacion(resultSet.getTimestamp("fecha_creacion"));
                escenas.add(escena);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return escenas;
    }

    public boolean updateEscena(Escena escena) {
        String sql = "UPDATE escena SET historia_id = ?, titulo = ?, video = ?, audio = ?, imagen = ?, " +
                "descripcion = ?, es_final = ?, texto_final = ?, fecha_creacion = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, escena.getHistoriaId());
            statement.setString(2, escena.getTitulo());
            statement.setString(3, escena.getVideo());
            statement.setString(4, escena.getAudio());
            statement.setString(5, escena.getImagen());
            statement.setString(6, escena.getDescripcion());
            statement.setBoolean(7, escena.isEsFinal());
            statement.setString(8, escena.getTextoFinal());
            statement.setTimestamp(9, escena.getFechaCreacion());
            statement.setInt(10, escena.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteEscena(int id) {
        String sql = "DELETE FROM escena WHERE id = ?";

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

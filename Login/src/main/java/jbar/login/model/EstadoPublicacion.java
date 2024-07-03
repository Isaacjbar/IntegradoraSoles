package jbar.login.model;

import java.sql.Timestamp;

public class EstadoPublicacion {
    private int id;
    private int historiaId;
    private String estado;
    private Timestamp fechaCambio;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHistoriaId() {
        return historiaId;
    }

    public void setHistoriaId(int historiaId) {
        this.historiaId = historiaId;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Timestamp getFechaCambio() {
        return fechaCambio;
    }

    public void setFechaCambio(Timestamp fechaCambio) {
        this.fechaCambio = fechaCambio;
    }
}

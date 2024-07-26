package jbar.login.model;

import java.sql.Timestamp;

public class Historia {
    private int id;
    private String titulo;
    private int autorId;
    private String multimedia;
    private String descripcion;
    private String estado;
    private Timestamp fechaCreacion;

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAutorId() {
        return autorId;
    }

    public void setAutorId(int autorId) {
        this.autorId = autorId;
    }

    public String getMultimedia() {return multimedia;}

    public void setMultimedia(String multimedia) {this.multimedia = multimedia;}

    public String getDescripcion() {return descripcion;}

    public void setDescripcion(String descripcion) {this.descripcion = descripcion;}

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstado() { return estado; }

    public void setEstado(String estado) { this.estado = estado; }

}

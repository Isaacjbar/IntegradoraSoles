package jbar.login.model;

public class Decision {
    private int id;
    private int escenaId;
    private String descripcion;
    private int escenaDestinoId;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEscenaId() {
        return escenaId;
    }

    public void setEscenaId(int escenaId) {
        this.escenaId = escenaId;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getEscenaDestinoId() {
        return escenaDestinoId;
    }

    public void setEscenaDestinoId(int escenaDestinoId) {
        this.escenaDestinoId = escenaDestinoId;
    }
}

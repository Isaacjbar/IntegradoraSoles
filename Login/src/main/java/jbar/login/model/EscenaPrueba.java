package jbar.login.model;

import java.sql.Timestamp;

public class EscenaPrueba {
    private int id;
    private int historiaId;
    private int escena_padre;
    private String titulo;
    private String video;
    private String audio;
    private String imagen;
    private String descripcion;
    private boolean esFinal;
    private String textoFinal;
    private Timestamp fechaCreacion;

    public EscenaPrueba(int id, int historiaId, int escena_padre, String titulo, String video, String audio, String imagen, String descripcion, boolean esFinal, String textoFinal, Timestamp fechaCreacion) {
        this.id = id;
        this.historiaId = historiaId;
        this.escena_padre = escena_padre;
        this.titulo = titulo;
        this.video = video;
        this.audio = audio;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.esFinal = esFinal;
        this.textoFinal = textoFinal;
        this.fechaCreacion = fechaCreacion;
    }

    public EscenaPrueba() {

    }

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

    public int getEscena_padre() {
        return escena_padre;
    }

    public void setEscena_padre(int escena_padre) {
        this.escena_padre = escena_padre;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isEsFinal() {
        return esFinal;
    }

    public void setEsFinal(boolean esFinal) {
        this.esFinal = esFinal;
    }

    public String getTextoFinal() {
        return textoFinal;
    }

    public void setTextoFinal(String textoFinal) {
        this.textoFinal = textoFinal;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}

package modelo;

import java.time.LocalDateTime;

public class Reporte {

    private int idReporte;
    private String titulo;
    private LocalDateTime fechaGeneracion;
    private String descripcion; // String type mapped to String

    public Reporte() {
    }

    public Reporte(int idReporte, String titulo, LocalDateTime fechaGeneracion, String descripcion) {
        this.idReporte = idReporte;
        this.titulo = titulo;
        this.fechaGeneracion = fechaGeneracion;
        this.descripcion = descripcion;
    }

    // Getters
    public int getIdReporte() {
        return idReporte;
    }

    public String getTitulo() {
        return titulo;
    }

    public LocalDateTime getFechaGeneracion() {
        return fechaGeneracion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    // Setters
    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setFechaGeneracion(LocalDateTime fechaGeneracion) {
        this.fechaGeneracion = fechaGeneracion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "REPORTE{" +
               "idReporte=" + idReporte +
               ", titulo='" + titulo + '\'' +
               ", fechaGeneracion=" + fechaGeneracion +
               ", descripcion='" + descripcion + '\'' +
               '}';
    }
}
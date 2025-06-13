package modelo;

import java.time.LocalDate; 

public class ReclamoAsignado {

    private LocalDate fechaAsignacion;
    private LocalDate fechaResolucion;
    private String comentarioRespuesta; 
    public ReclamoAsignado() {
    }

    public ReclamoAsignado(LocalDate fechaAsignacion, LocalDate fechaResolucion, String comentarioRespuesta) {
        this.fechaAsignacion = fechaAsignacion;
        this.fechaResolucion = fechaResolucion;
        this.comentarioRespuesta = comentarioRespuesta;
    }

    // Getters
    public LocalDate getFechaAsignacion() {
        return fechaAsignacion;
    }

    public LocalDate getFechaResolucion() {
        return fechaResolucion;
    }

    public String getComentarioRespuesta() {
        return comentarioRespuesta;
    }

    // Setters
    public void setFechaAsignacion(LocalDate fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }

    public void setFechaResolucion(LocalDate fechaResolucion) {
        this.fechaResolucion = fechaResolucion;
    }

    public void setComentarioRespuesta(String comentarioRespuesta) {
        this.comentarioRespuesta = comentarioRespuesta;
    }

    @Override
    public String toString() {
        return "ReclamoAsignado{" +
               "fechaAsignacion=" + fechaAsignacion +
               ", fechaResolucion=" + fechaResolucion +
               ", comentarioRespuesta='" + comentarioRespuesta + '\'' +
               '}';
    }
}
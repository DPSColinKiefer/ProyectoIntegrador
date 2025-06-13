package modelo;

import java.time.LocalDate; 

public class Cancelacion {

    private int idCancelacion;
    private String motivoCancelacion;
    private LocalDate fechaCancelacion;

    public Cancelacion() {
    }

    public Cancelacion(int idCancelacion, String motivoCancelacion, LocalDate fechaCancelacion) {
        this.idCancelacion = idCancelacion;
        this.motivoCancelacion = motivoCancelacion;
        this.fechaCancelacion = fechaCancelacion;
    }

    // Getters
    public int getIdCancelacion() {
        return idCancelacion;
    }

    public String getMotivoCancelacion() {
        return motivoCancelacion;
    }

    public LocalDate getFechaCancelacion() {
        return fechaCancelacion;
    }

    // Setters
    public void setIdCancelacion(int idCancelacion) {
        this.idCancelacion = idCancelacion;
    }

    public void setMotivoCancelacion(String motivoCancelacion) {
        this.motivoCancelacion = motivoCancelacion;
    }

    public void setFechaCancelacion(LocalDate fechaCancelacion) {
        this.fechaCancelacion = fechaCancelacion;
    }

    @Override
    public String toString() {
        return "CANCELACION{" +
               "idCancelacion=" + idCancelacion +
               ", motivoCancelacion='" + motivoCancelacion + '\'' +
               ", fechaCancelacion=" + fechaCancelacion +
               '}';
    }
}

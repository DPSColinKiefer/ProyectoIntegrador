package modelo;

import java.time.LocalDateTime;

public class Reclamo {

    private int idReclamo;
    private String motivo;
    private String descripcion;
    private String estado;
    private LocalDateTime fechaReclamo;

    public Reclamo() {
    }

    public Reclamo(int idReclamo, String motivo, String descripcion, String estado, LocalDateTime fechaReclamo) {
        this.idReclamo = idReclamo;
        this.motivo = motivo;
        this.descripcion = descripcion;
        this.estado = estado;
        this.fechaReclamo = fechaReclamo;
    }

    public int getIdReclamo() {
        return idReclamo;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public LocalDateTime getFechaReclamo() {
        return fechaReclamo;
    }

    // Setters
    public void setIdReclamo(int idReclamo) {
        this.idReclamo = idReclamo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setFechaReclamo(LocalDateTime fechaReclamo) {
        this.fechaReclamo = fechaReclamo;
    }

    @Override
    public String toString() {
        return "RECLAMO{" +
               "idReclamo=" + idReclamo +
               ", motivo='" + motivo + '\'' +
               ", descripcion='" + descripcion + '\'' +
               ", estado='" + estado + '\'' +
               ", fechaReclamo=" + fechaReclamo +
               '}';
    }
}

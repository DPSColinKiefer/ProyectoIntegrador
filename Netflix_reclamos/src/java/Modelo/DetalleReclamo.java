package Modelo;

public class DetalleReclamo {
    private int idDetalle;
    private int idReclamo;
    private String descripcion;

    public DetalleReclamo() {
    }

    public DetalleReclamo(int idDetalle, int idReclamo, String descripcion) {
        this.idDetalle = idDetalle;
        this.idReclamo = idReclamo;
        this.descripcion = descripcion;
    }

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public int getIdReclamo() {
        return idReclamo;
    }

    public void setIdReclamo(int idReclamo) {
        this.idReclamo = idReclamo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}

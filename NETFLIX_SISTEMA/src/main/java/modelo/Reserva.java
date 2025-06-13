/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author colin
 */
public class Reserva {

    private int idReserva;
    private String fechaReserva;
    private String estado;

    public Reserva() {
    }

    public Reserva(int idReserva, String fechaReserva, String estado) {
        this.idReserva = idReserva;
        this.fechaReserva = fechaReserva;
        this.estado = estado;
    }

    // Getters
    public int getIdReserva() {
        return idReserva;
    }

    public String getFechaReserva() {
        return fechaReserva;
    }

    public String getEstado() {
        return estado;
    }

    // Setters
    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public void setFechaReserva(String fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "RESERVA{" +
               "idReserva=" + idReserva +
               ", fechaReserva='" + fechaReserva + '\'' +
               ", estado='" + estado + '\'' +
               '}';
    }
}

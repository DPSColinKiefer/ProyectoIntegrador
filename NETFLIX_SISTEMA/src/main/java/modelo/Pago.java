/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.time.LocalDateTime;

public class Pago {

    private int idPago;
    private double monto; // Mapped Decimal to double
    private String tipoPago;
    private LocalDateTime fechaPago;
    private String metodoPago;
    private String descripcionPago; // String type mapped to String

    public Pago() {
    }

    public Pago(int idPago, double monto, String tipoPago, LocalDateTime fechaPago, String metodoPago, String descripcionPago) {
        this.idPago = idPago;
        this.monto = monto;
        this.tipoPago = tipoPago;
        this.fechaPago = fechaPago;
        this.metodoPago = metodoPago;
        this.descripcionPago = descripcionPago;
    }

    // Getters
    public int getIdPago() {
        return idPago;
    }

    public double getMonto() {
        return monto;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public LocalDateTime getFechaPago() {
        return fechaPago;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public String getDescripcionPago() {
        return descripcionPago;
    }

    // Setters
    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public void setFechaPago(LocalDateTime fechaPago) {
        this.fechaPago = fechaPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public void setDescripcionPago(String descripcionPago) {
        this.descripcionPago = descripcionPago;
    }

    @Override
    public String toString() {
        return "PAGO{" +
               "idPago=" + idPago +
               ", monto=" + monto +
               ", tipoPago='" + tipoPago + '\'' +
               ", fechaPago=" + fechaPago +
               ", metodoPago='" + metodoPago + '\'' +
               ", descripcionPago='" + descripcionPago + '\'' +
               '}';
    }
}

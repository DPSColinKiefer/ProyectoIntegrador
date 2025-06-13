/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author colin
 */
public class SoporteTecnico {

    private int idAgente;
    private String areaAsignada;
    private String nombre;
    private String correo;
    private String cargo;

    public SoporteTecnico() {
    }

    public SoporteTecnico(int idAgente, String areaAsignada, String nombre, String correo, String cargo) {
        this.idAgente = idAgente;
        this.areaAsignada = areaAsignada;
        this.nombre = nombre;
        this.correo = correo;
        this.cargo = cargo;
    }

    public int getIdAgente() {
        return idAgente;
    }

    public String getAreaAsignada() {
        return areaAsignada;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public String getCargo() {
        return cargo;
    }

    // Setters
    public void setIdAgente(int idAgente) {
        this.idAgente = idAgente;
    }

    public void setAreaAsignada(String areaAsignada) {
        this.areaAsignada = areaAsignada;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    @Override
    public String toString() {
        return "SoporteTecnico{" +
               "idAgente=" + idAgente +
               ", areaAsignada='" + areaAsignada + '\'' +
               ", nombre='" + nombre + '\'' +
               ", correo='" + correo + '\'' +
               ", cargo='" + cargo + '\'' +
               '}';
    }
}

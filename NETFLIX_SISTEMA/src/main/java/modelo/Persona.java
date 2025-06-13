/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.time.LocalDateTime;
/**
 *
 * @author colin
 */
public class Persona {
    private int idPersona;
    private String nombre;
    private String correo;
    private String contraseña; // Note: In Spanish, 'ñ' might cause issues depending on encoding, consider 'contrasena'
    private String estado;
    private LocalDateTime fechaRegistro;

    // Default constructor
    public Persona() {
    }

    // Parameterized constructor
    public Persona(int idPersona, String nombre, String correo, String contraseña, String estado, LocalDateTime fechaRegistro) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.correo = correo;
        this.contraseña = contraseña;
        this.estado = estado;
        this.fechaRegistro = fechaRegistro;
    }

    // Getter for idPersona
    public int getIdPersona() {
        return idPersona;
    }

    // Setter for idPersona
    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    // Getter for nombre
    public String getNombre() {
        return nombre;
    }

    // Setter for nombre
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Getter for correo
    public String getCorreo() {
        return correo;
    }

    // Setter for correo
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    // Getter for contraseña
    public String getContraseña() {
        return contraseña;
    }

    // Setter for contraseña
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    // Getter for estado
    public String getEstado() {
        return estado;
    }

    // Setter for estado
    public void setEstado(String estado) {
        this.estado = estado;
    }

    // Getter for fechaRegistro
    public LocalDateTime getFechaRegistro() {
        return fechaRegistro;
    }

    // Setter for fechaRegistro
    public void setFechaRegistro(LocalDateTime fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    @Override
    public String toString() {
        return "PERSONA{" +
               "idPersona=" + idPersona +
               ", nombre='" + nombre + '\'' +
               ", correo='" + correo + '\'' +
               ", estado='" + estado + '\'' +
               ", fechaRegistro=" + fechaRegistro +
               '}';
    }
}

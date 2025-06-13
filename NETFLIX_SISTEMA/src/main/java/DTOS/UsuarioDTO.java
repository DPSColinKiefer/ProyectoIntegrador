/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTOS;

import java.time.LocalDateTime;

/**
 *
 * @author colin
 */
public class UsuarioDTO {
    private int id;
    private String nombre;
    private String correo;
    private String contrasenaHash;
    private boolean estado;
    private LocalDateTime fechaRegistro;
    private String rol;
    
    // Constructores
    public UsuarioDTO() {}
    
    public UsuarioDTO(int id, String nombre, String correo, String contrasenaHash, 
                      boolean estado, LocalDateTime fechaRegistro, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasenaHash = contrasenaHash;
        this.estado = estado;
        this.fechaRegistro = fechaRegistro;
        this.rol = rol;
    }
    
    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    
    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }
    
    public String getContrasenaHash() { return contrasenaHash; }
    public void setContrasenaHash(String contrasenaHash) { this.contrasenaHash = contrasenaHash; }
    
    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }
    
    public LocalDateTime getFechaRegistro() { return fechaRegistro; }
    public void setFechaRegistro(LocalDateTime fechaRegistro) { this.fechaRegistro = fechaRegistro; }
    
    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }
    
    @Override
    public String toString() {
        return "UsuarioDTO{" +
               "id=" + id +
               ", nombre='" + nombre + '\'' +
               ", correo='" + correo + '\'' +
               ", estado=" + estado +
               ", fechaRegistro=" + fechaRegistro +
               ", rol='" + rol + '\'' +
               '}';
    }
}

package Modelo;

import java.util.Date;

public class Usuario {
    private int idUsuario;
    private String nombres;
    private Date fechaNacimiento;
    private String telefono;
    private String correo;
    private String contrasena;
    private String rol;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombres, Date fechaNacimiento, String telefono, String correo, String contrasena, String rol) {
        this.idUsuario = idUsuario;
        this.nombres = nombres;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.correo = correo;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getNombres() { return nombres; }
    public void setNombres(String nombres) { this.nombres = nombres; }

    public Date getFechaNacimiento() { return fechaNacimiento; }
    public void setFechaNacimiento(Date fechaNacimiento) { this.fechaNacimiento = fechaNacimiento; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getContrasena() { return contrasena; }
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }

    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }
}

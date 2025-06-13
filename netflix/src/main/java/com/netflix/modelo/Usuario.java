package com.netflix.modelo;

import java.time.LocalDateTime;

public class Usuario {
    private int id;
    private String nombre;
    private String correo;
    private boolean estado;
    private LocalDateTime fechaRegistro;
    private String contrasena; // Asegúrate de que este atributo esté aquí

    // --- Constructor por defecto (SIN ARGUMENTOS) ---
    // Este es el que te falta y el que el DAO intenta usar.
    public Usuario() {
        // Puedes dejarlo vacío o inicializar valores por defecto si lo deseas
    }

    // --- Tu constructor con todos los argumentos (EXISTENTE) ---
    public Usuario(int id, String nombre, String correo, boolean estado, LocalDateTime fechaRegistro, String contrasena) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.estado = estado;
        this.fechaRegistro = fechaRegistro;
        this.contrasena = contrasena;
    }

    // --- Getters y Setters (los que ya tienes) ---
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() { // Asegúrate de que este getter esté aquí
        return contrasena;
    }

    public void setContrasena(String contrasena) { // Asegúrate de que este setter esté aquí
        this.contrasena = contrasena;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public LocalDateTime getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDateTime fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    // Opcional: toString() para facilitar la depuración
    @Override
    public String toString() {
        return "Usuario{" +
               "id=" + id +
               ", nombre='" + nombre + '\'' +
               ", correo='" + correo + '\'' +
               // Evita imprimir la contraseña en toString() por seguridad
               ", estado=" + estado +
               ", fechaRegistro=" + fechaRegistro +
               '}';
    }

}

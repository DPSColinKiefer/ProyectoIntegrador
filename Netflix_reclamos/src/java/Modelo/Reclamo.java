package Modelo;

import java.util.Date;
import java.util.List;

public class Reclamo {

    private int idReclamo;
    private int idUsuario;
    private int idCategoria;
    private int idTipo;
    private String titulo;
    private String descripcion;
    private String estado;
    private String respuestaAdmin;

    private String nombreCategoria;
    private String nombreTipo;
    
    private String nombreUsuario;

    public Reclamo() {
    }

    public Reclamo(int idReclamo, int idUsuario, int idCategoria, int idTipo, String titulo, String descripcion, String estado, String respuestaAdmin, String nombreCategoria, String nombreTipo, String nombreUsuario) {
        this.idReclamo = idReclamo;
        this.idUsuario = idUsuario;
        this.idCategoria = idCategoria;
        this.idTipo = idTipo;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.estado = estado;
        this.respuestaAdmin = respuestaAdmin;
        this.nombreCategoria = nombreCategoria;
        this.nombreTipo = nombreTipo;
        this.nombreUsuario = nombreUsuario;
    }
    
    public int getIdReclamo() {
        return idReclamo;
    }

    public void setIdReclamo(int idReclamo) {
        this.idReclamo = idReclamo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRespuestaAdmin() {
        return respuestaAdmin;
    }

    public void setRespuestaAdmin(String respuestaAdmin) {
        this.respuestaAdmin = respuestaAdmin;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
}

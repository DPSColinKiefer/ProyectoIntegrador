package modelo;

import java.time.LocalDate; 

public class Contenido {

    private int idContenido;
    private String titulo;
    private String tipo;
    private String categoria;
    private LocalDate fechaLanzamiento;
    private String estado;

    public Contenido() {
    }

    public Contenido(int idContenido, String titulo, String tipo, String categoria, LocalDate fechaLanzamiento, String estado) {
        this.idContenido = idContenido;
        this.titulo = titulo;
        this.tipo = tipo;
        this.categoria = categoria;
        this.fechaLanzamiento = fechaLanzamiento;
        this.estado = estado;
    }

    // Getters
    public int getIdContenido() {
        return idContenido;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getTipo() {
        return tipo;
    }

    public String getCategoria() {
        return categoria;
    }

    public LocalDate getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public String getEstado() {
        return estado;
    }

    // Setters
    public void setIdContenido(int idContenido) {
        this.idContenido = idContenido;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void setFechaLanzamiento(LocalDate fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "CONTENIDO{" +
               "idContenido=" + idContenido +
               ", titulo='" + titulo + '\'' +
               ", tipo='" + tipo + '\'' +
               ", categoria='" + categoria + '\'' +
               ", fechaLanzamiento=" + fechaLanzamiento +
               ", estado='" + estado + '\'' +
               '}';
    }
}

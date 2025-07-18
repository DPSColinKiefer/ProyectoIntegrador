package Modelo;

public class TipoReclamo {
    private int idTipo;
    private String nombre;
    private int idCategoria;

    public TipoReclamo() {}

    public TipoReclamo(int idTipo, String nombre, int idCategoria) {
        this.idTipo = idTipo;
        this.nombre = nombre;
        this.idCategoria = idCategoria;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
}

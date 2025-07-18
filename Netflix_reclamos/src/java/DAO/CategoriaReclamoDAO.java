package DAO;

import Modelo.CategoriaReclamo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaReclamoDAO {
    private Connection con;

    public CategoriaReclamoDAO(Connection con) {
        this.con = con;
    }

    public List<CategoriaReclamo> listarCategorias() throws SQLException {
        List<CategoriaReclamo> lista = new ArrayList<>();
        String sql = "SELECT id_categoria, nombre FROM categoria_reclamo";

        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CategoriaReclamo c = new CategoriaReclamo();
                c.setIdCategoria(rs.getInt("id_categoria"));
                c.setNombre(rs.getString("nombre"));
                lista.add(c);
            }
        }

        return lista;
    }
}

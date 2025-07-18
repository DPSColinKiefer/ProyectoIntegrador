package DAO;

import Modelo.TipoReclamo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TipoReclamoDAO {

    private Connection con;

    public TipoReclamoDAO(Connection con) {
        this.con = con;
    }

    public List<TipoReclamo> listarTipos() throws SQLException {
        List<TipoReclamo> lista = new ArrayList<>();
        String sql = "SELECT id_tipo, nombre, id_categoria FROM tipo_reclamo";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                TipoReclamo t = new TipoReclamo();
                t.setIdTipo(rs.getInt("id_tipo"));
                t.setNombre(rs.getString("nombre"));
                t.setIdCategoria(rs.getInt("id_categoria"));
                lista.add(t);
            }
        }

        return lista;
    }

    public List<TipoReclamo> listarPorCategoria(int idCategoria) throws SQLException {
        List<TipoReclamo> lista = new ArrayList<>();
        String sql = "SELECT id_tipo, nombre FROM tipo_reclamo WHERE id_categoria = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idCategoria);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TipoReclamo tipo = new TipoReclamo();
                    tipo.setIdTipo(rs.getInt("id_tipo"));
                    tipo.setNombre(rs.getString("nombre"));
                    lista.add(tipo);
                }
            }
        }
        return lista;
    }
}

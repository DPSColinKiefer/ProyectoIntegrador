package DAO;

import Modelo.Reclamo;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ReclamoDAO {

    private Connection con;

    public ReclamoDAO(Connection con) {
        this.con = con;
    }

    public boolean crearReclamo(Reclamo r) throws SQLException {
        String sql = "INSERT INTO reclamo (id_usuario, id_categoria, id_tipo, titulo, descripcion, estado) "
                + "VALUES (?, ?, ?, ?, ?, 'Pendiente')";

        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, r.getIdUsuario());
            ps.setInt(2, r.getIdCategoria());
            ps.setInt(3, r.getIdTipo());
            ps.setString(4, r.getTitulo());
            ps.setString(5, r.getDescripcion());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        r.setIdReclamo(rs.getInt(1));
                        return true;
                    }
                }
            }
            return false;
        }
    }

    public List<Reclamo> listarReclamosPorUsuario(int idUsuario) throws SQLException {
        List<Reclamo> lista = new ArrayList<>();

        String sql = "SELECT r.id_reclamo, r.id_usuario, r.id_categoria, r.id_tipo, "
                + "r.titulo, r.descripcion, r.estado, r.respuesta_admin, "
                + "c.nombre AS nombre_categoria, t.nombre AS nombre_tipo "
                + "FROM reclamo r "
                + "INNER JOIN categoria_reclamo c ON r.id_categoria = c.id_categoria "
                + "INNER JOIN tipo_reclamo t ON r.id_tipo = t.id_tipo "
                + "WHERE r.id_usuario = ? "
                + "ORDER BY FIELD(r.estado, 'Pendiente', 'En revisión', 'Resuelto')";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reclamo r = new Reclamo();
                    r.setIdReclamo(rs.getInt("id_reclamo"));
                    r.setIdUsuario(rs.getInt("id_usuario"));
                    r.setIdCategoria(rs.getInt("id_categoria"));
                    r.setIdTipo(rs.getInt("id_tipo"));
                    r.setTitulo(rs.getString("titulo"));
                    r.setDescripcion(rs.getString("descripcion"));
                    r.setEstado(rs.getString("estado"));

                    String respuesta = rs.getString("respuesta_admin");
                    r.setRespuestaAdmin(respuesta != null ? respuesta : "");

                    r.setNombreCategoria(rs.getString("nombre_categoria"));
                    r.setNombreTipo(rs.getString("nombre_tipo"));

                    lista.add(r);
                }
            }
        }

        return lista;
    }

    public Reclamo obtenerReclamoPorId(int idReclamo) throws SQLException {
        String sql = "SELECT r.*, c.nombre AS nombre_categoria, t.nombre AS nombre_tipo "
                + "FROM reclamo r "
                + "JOIN categoria_reclamo c ON r.id_categoria = c.id_categoria "
                + "JOIN tipo_reclamo t ON r.id_tipo = t.id_tipo "
                + "WHERE r.id_reclamo = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, idReclamo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Reclamo r = new Reclamo();
                    r.setIdReclamo(rs.getInt("id_reclamo"));
                    r.setIdUsuario(rs.getInt("id_usuario"));
                    r.setIdCategoria(rs.getInt("id_categoria"));
                    r.setIdTipo(rs.getInt("id_tipo"));
                    r.setTitulo(rs.getString("titulo"));
                    r.setDescripcion(rs.getString("descripcion"));
                    r.setEstado(rs.getString("estado"));
                    r.setRespuestaAdmin(rs.getString("respuesta_admin"));
                    r.setNombreCategoria(rs.getString("nombre_categoria"));
                    r.setNombreTipo(rs.getString("nombre_tipo"));
                    return r;
                }
            }
        }
        return null;
    }

    public List<Reclamo> listarTodosLosReclamos() throws SQLException {
        List<Reclamo> lista = new ArrayList<>();
        String sql = "SELECT r.*, u.nombres AS nombre_usuario, c.nombre AS nombre_categoria, t.nombre AS nombre_tipo "
                + "FROM reclamo r "
                + "INNER JOIN usuario u ON r.id_usuario = u.id_usuario "
                + "INNER JOIN categoria_reclamo c ON r.id_categoria = c.id_categoria "
                + "INNER JOIN tipo_reclamo t ON r.id_tipo = t.id_tipo "
                + "ORDER BY FIELD(r.estado, 'Pendiente', 'En revisión', 'Resuelto')";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Reclamo r = new Reclamo();
                r.setIdReclamo(rs.getInt("id_reclamo"));
                r.setIdUsuario(rs.getInt("id_usuario"));
                r.setIdCategoria(rs.getInt("id_categoria"));
                r.setIdTipo(rs.getInt("id_tipo"));
                r.setTitulo(rs.getString("titulo"));
                r.setDescripcion(rs.getString("descripcion"));
                r.setEstado(rs.getString("estado"));
                r.setRespuestaAdmin(rs.getString("respuesta_admin"));
                r.setNombreUsuario(rs.getString("nombre_usuario"));
                r.setNombreCategoria(rs.getString("nombre_categoria"));
                r.setNombreTipo(rs.getString("nombre_tipo"));
                lista.add(r);
            }
        }
        return lista;
    }

    public boolean actualizarRespuestaYEstado(int idReclamo, String respuesta, String estado) throws SQLException {
        String sql = "UPDATE reclamo SET respuesta_admin = ?, estado = ? WHERE id_reclamo = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, respuesta);
            ps.setString(2, estado);
            ps.setInt(3, idReclamo);
            return ps.executeUpdate() > 0;
        }
    }

    public void responderReclamo(int idReclamo, String estado, String respuesta) throws SQLException {
        String sql = "UPDATE reclamo SET estado = ?, respuesta_admin = ? WHERE id_reclamo = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, estado);
            stmt.setString(2, respuesta);
            stmt.setInt(3, idReclamo);
            int filas = stmt.executeUpdate();
        }
    }

    public int contarReclamos() throws SQLException {
        String sql = "SELECT COUNT(*) FROM reclamo";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int contarReclamosPorEstado(String estado) throws SQLException {
        String sql = "SELECT COUNT(*) FROM reclamo WHERE estado = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, estado);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        }
    }

    public Map<String, Integer> contarReclamosPorCategoria() throws SQLException {
        Map<String, Integer> map = new LinkedHashMap<>();
        String sql = "SELECT c.nombre, COUNT(*) AS total FROM reclamo r "
                + "JOIN categoria_reclamo c ON r.id_categoria = c.id_categoria "
                + "GROUP BY c.nombre";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                map.put(rs.getString("nombre"), rs.getInt("total"));
            }
        }
        return map;
    }

}

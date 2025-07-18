package DAO;

import Modelo.Usuario;

import java.sql.*;

public class UsuarioDAO {

    private Connection con;

    public UsuarioDAO(Connection con) {
        this.con = con;
    }

    public Usuario login(String usuario, String contrasena) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE (correo = ? OR telefono = ?) AND contrasena = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, usuario);
            ps.setString(3, contrasena);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt("id_usuario"));
                    u.setNombres(rs.getString("nombres"));
                    u.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                    u.setTelefono(rs.getString("telefono"));
                    u.setCorreo(rs.getString("correo"));
                    u.setContrasena(rs.getString("contrasena"));
                    u.setRol(rs.getString("rol"));
                    return u;
                }
            }
        }
        return null;
    }

    public boolean registrar(Usuario u) throws SQLException {
        String sql = "INSERT INTO usuario (nombres, fecha_nacimiento, telefono, correo, contrasena, rol) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, u.getNombres());
            ps.setDate(2, new java.sql.Date(u.getFechaNacimiento().getTime()));
            ps.setString(3, u.getTelefono());
            ps.setString(4, u.getCorreo());
            ps.setString(5, u.getContrasena());
            ps.setString(6, "cliente");

            ps.executeUpdate();
            return true;
        } catch (SQLIntegrityConstraintViolationException e) {
            return false;
        }
    }
}

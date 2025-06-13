package com.netflix.dao;

import com.netflix.modelo.Usuario;
import com.netflix.util.conexion.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public Usuario obtenerUsuarioPorCorreo(String correo) throws SQLException {
        Usuario usuario = null;
        String sql = "SELECT id_usuario, nombre, correo, contrasena, estado, fecha_registro FROM usuario WHERE correo = ?";

        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, correo);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setId(rs.getInt("id_usuario"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setContrasena(rs.getString("contrasena")); 
                    usuario.setEstado(rs.getBoolean("estado"));
                    usuario.setFechaRegistro(rs.getObject("fecha_registro", LocalDateTime.class));
                }
            }
        }
        return usuario;
    }

    public boolean insertarUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuario (nombre, correo, contrasena, estado, fecha_registro) VALUES (?, ?, ?, ?, ?)";
        boolean filaAfectada = false;
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getCorreo());
            stmt.setString(3, usuario.getContrasena());
            stmt.setBoolean(4, usuario.isEstado());
            stmt.setObject(5, usuario.getFechaRegistro());

            int filas = stmt.executeUpdate();
            filaAfectada = (filas > 0);
        }
        return filaAfectada;
    }

    public boolean actualizarUsuario(Usuario usuario) throws SQLException {
        String sql = "UPDATE usuario SET nombre = ?, correo = ?, contrasena = ?, estado = ?, fecha_registro = ? WHERE id_usuario = ?";
        boolean filaAfectada = false;
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getCorreo());
            stmt.setString(3, usuario.getContrasena());
            stmt.setBoolean(4, usuario.isEstado());
            stmt.setObject(5, usuario.getFechaRegistro());
            stmt.setInt(6, usuario.getId());

            int filas = stmt.executeUpdate();
            filaAfectada = (filas > 0);
        }
        return filaAfectada;
    }

    public boolean eliminarUsuario(int id) throws SQLException {
        String sql = "DELETE FROM usuario WHERE id_usuario = ?";
        boolean filaAfectada = false;
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            int filas = stmt.executeUpdate();
            filaAfectada = (filas > 0);
        }
        return filaAfectada;
    }

    public List<Usuario> listarTodosLosUsuarios() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT id_usuario, nombre, correo, contrasena, estado, fecha_registro FROM usuario";
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setEstado(rs.getBoolean("estado"));
                usuario.setFechaRegistro(rs.getObject("fecha_registro", LocalDateTime.class));
                usuarios.add(usuario);
            }
        }
        return usuarios;
    }
}
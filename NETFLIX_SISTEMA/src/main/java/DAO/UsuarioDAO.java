package DAO;


import DTOS.UsuarioDTO;
import util.conexion;
import java.sql.*;
import java.time.LocalDateTime;
import modelo.Usuario;

public class UsuarioDAO {
    private Connection conn;
    
    public UsuarioDAO(Connection conn) {
        this.conn = conn;
    }
    
    public UsuarioDTO validarLogin(String correo, String contrasenaHash) throws SQLException {
        String sql = "SELECT u.id_usuario, u.nombre, u.correo, u.estado, u.fecha_registro, r.nombre_rol " +
                     "FROM usuarios u " +
                     "JOIN usuario_rol ur ON u.id_usuario = ur.id_usuario " +
                     "JOIN roles r ON ur.id_rol = r.id_rol " +
                     "WHERE u.correo = ? AND u.contrasena_hash = ? AND u.estado = true";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, correo);
            ps.setString(2, contrasenaHash);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                UsuarioDTO usuario = new UsuarioDTO();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setEstado(rs.getBoolean("estado"));
                usuario.setFechaRegistro(rs.getTimestamp("fecha_registro").toLocalDateTime());
                usuario.setRol(rs.getString("nombre_rol"));
                return usuario;
            }
        }
        return null;
    }
    
    public boolean registrarUsuario(UsuarioDTO usuario) throws SQLException {
        String sql = "INSERT INTO usuarios (nombre, correo, contrasena_hash, estado, fecha_registro) VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getContrasenaHash());
            ps.setBoolean(4, true); // Estado activo por defecto
            ps.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Método para convertir Usuario a UsuarioDTO
    public static UsuarioDTO toDTO(Usuario usuario, String contrasenaHash) {
        return new UsuarioDTO(
            usuario.getId(),
            usuario.getNombre(),
            usuario.getCorreo(),
            contrasenaHash,
            usuario.isEstado(),
            usuario.getFechaRegistro(),
            usuario.getRol()
        );
    }
    
    // Método para convertir UsuarioDTO a Usuario
    public static Usuario fromDTO(UsuarioDTO dto) {
        return new Usuario(
            dto.getId(),
            dto.getNombre(),
            dto.getCorreo(),
            dto.isEstado(),
            dto.getFechaRegistro(),
            null, // No exponemos la contraseña hash
            dto.getRol()
        );
    }
}


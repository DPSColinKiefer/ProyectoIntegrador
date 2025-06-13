package DAO;


import util.conexion;
import java.sql.*;

public class UsuarioDAO {

    public boolean autenticarUsuario(String correo, String contrasena) {
        String sql = "SELECT COUNT(*) FROM USUARIO WHERE correo = ? AND contrasena = ? AND estadoUsuario = 'ACTIVO'";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = conexion.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, correo);
            pstmt.setString(2, contrasena);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
        } catch (SQLException e) {
            System.err.println("Error al autenticar usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos(rs, pstmt, conn);
        }
        
        return false;
    }
    

    public String obtenerNombreUsuario(String correo) {
        String sql = "SELECT nombre FROM USUARIO WHERE correo = ? AND estadoUsuario = 'ACTIVO'";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = conexion.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, correo);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getString("nombre");
            }
            
        } catch (SQLException e) {
            System.err.println("Error al obtener nombre de usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos(rs, pstmt, conn);
        }
        
        return null;
    }

    public boolean existeCorreo(String correo) {
        String sql = "SELECT COUNT(*) FROM USUARIO WHERE correo = ?";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = conexion.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, correo);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
        } catch (SQLException e) {
            System.err.println("Error al verificar correo: " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos(rs, pstmt, conn);
        }
        
        return false;
    }
    

    private void cerrarRecursos(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conexion.closeConnection(conn);
        } catch (SQLException e) {
            System.err.println("Error al cerrar recursos: " + e.getMessage());
        }
    }
}

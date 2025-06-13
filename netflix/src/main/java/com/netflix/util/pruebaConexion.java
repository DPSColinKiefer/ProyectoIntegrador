package com.netflix.util;

import java.sql.Connection;
import com.netflix.util.conexion.*;
public class pruebaConexion {
    
    public static void main(String[] args) {
        
        Connection conn = conexion.getConnection();
        
        if (conn != null) {
            System.out.println("CONEXIÓN EXITOSA");
            try {
                conn.close();
            } catch (Exception e) {
                System.out.println("Error al cerrar: " + e.getMessage());
            }
        } else {
            System.out.println("NO SE PUDO CONECTAR");
        }
    }
}

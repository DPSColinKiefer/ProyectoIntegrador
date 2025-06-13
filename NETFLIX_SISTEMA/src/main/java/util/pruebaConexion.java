/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package util;

import java.sql.Connection;

public class pruebaConexion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {


        Connection conn = conexion.getConnection();
        
        if (conn != null) {
            System.out.println("Conexión exitosa a MySQL");
            try {
                conn.close();
            } catch (Exception e) {
                System.out.println("Error cerrando conexión");
            }
        } else {
            System.out.println("Error de conexión a MySQL");
        }
    }   
}

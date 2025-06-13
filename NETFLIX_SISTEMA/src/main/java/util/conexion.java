package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {

    private static final String URL = "jdbc:mysql://localhost:3306/nProyect"; // Your database name
    private static final String USUARIO = "root";
    private static final String PASSWORD = "colin143";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Cargar el driver (necesario para versiones antiguas de JDBC, pero buena práctica)
            // Class.forName("com.mysql.cj.jdbc.Driver"); // No longer strictly needed for JDBC 4.0+ but harmless
            conn = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos."); // For debugging
        } catch (SQLException e) {
            System.err.println("Error de conexión a la base de datos: " + e.getMessage());
            e.printStackTrace(); // Imprime el stack trace para un diagnóstico completo
        }
        return conn;
    }

    // *** RECOMENDACIÓN: Agrega un método para cerrar la conexión ***
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Conexión cerrada."); // For debugging
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}

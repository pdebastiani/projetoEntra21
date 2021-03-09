
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    
    public static Connection conectar(){
        Connection con = null;
        String url = "jdbc:postgresql://localhost:5432/financeiro";
        String user = "postgres";
        String password = "123";
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao conectar com o banco (financeiro)");
        }
        return con;                
    }
}

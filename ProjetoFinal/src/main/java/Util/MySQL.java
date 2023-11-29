package Util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQL implements DBConnection{
    private String URL = "jdbc:mysql://localhost:3306/nome_indefinido";
    private String USER = "root";
    private String PASSWORD = "duda2404";
    @Override
    public Connection getConnection() {
        try{
            return DriverManager.getConnection(URL,USER,PASSWORD);
        }catch(SQLException e){
            throw new RuntimeException("Erro ao conectar ao banco de dados",e);
        }
    }
}

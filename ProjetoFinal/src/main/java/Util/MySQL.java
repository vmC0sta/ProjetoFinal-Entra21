package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQL implements DBConnection{
    private String URL = "jdbc:mysql://localhost:3306/mydb";
    private String USER = "root";
    private String PASSWORD = "12345";
    
    
    @Override
    public Connection getConnection() {
        try{
        	try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
            return DriverManager.getConnection(URL,USER,PASSWORD);
        }catch(SQLException e){
            throw new RuntimeException("Erro ao conectar ao banco de dados",e);
        }
    }
}

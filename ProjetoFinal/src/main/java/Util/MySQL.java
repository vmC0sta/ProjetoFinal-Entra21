package Util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQL implements DBConnection{
    private String URL = "jdbc:mysql://localhost:3306/mydb";
    private String USER = "root";
    private String PASSWORD = "duda2404";
    private Connection conexao;
    
    @Override
    public Connection getConnection() {
        try{
            conexao =DriverManager.getConnection(URL,USER,PASSWORD);
            return conexao;
        }catch(SQLException e){
            throw new RuntimeException("Erro ao conectar ao banco de dados",e);
        }
    }


	@Override
	public void closeConnection() {
		 if (conexao != null) {
             try {
                 conexao.close();
                 System.out.println("Conexão fechada com sucesso.");
             } catch (SQLException e) {
                 e.printStackTrace();
             }
		 }
		 
	}
}

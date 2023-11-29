import controller.Controller;
import model.produto.Estoque;
import model.produto.Produto;
import Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstoqueController implements Controller<Estoque> {
    private DBConnection dbConnection;

    public EstoqueController(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    @Override
    public boolean salvar(Estoque estoque) {
    	try (
    	        Connection connection = dbConnection.getConnection();
    	        PreparedStatement preparedStatement = connection.prepareStatement(
    	                "INSERT INTO estoque ( quantidade, produto, valortotal) VALUES (?, ?, ?)")
    	) {
    		
    		preparedStatement.setInt(1, estoque.getQuantidade());
    		preparedStatement.setString(2, estoque.getproduto());
    	    preparedStatement.setDouble(3, estoque.getvalortotal());
    	    

    	    preparedStatement.executeUpdate();
    	    return true;
    	} catch (SQLException e) {
    	    throw new RuntimeException("Erro ao salvar no estoque", e);
    	}

    }

    @Override
    public List<Estoque> exibirTodos() {
        try (
                Connection connection = dbConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "SELECT E.id, P.nome as produto, E.quantidade " +
                                "FROM estoque E " +
                                "INNER JOIN produto P ON E.id_produto = P.id");
                ResultSet resultSet = preparedStatement.executeQuery()
        ) {
            List<Estoque> estoques = new ArrayList<>();
            while (resultSet.next()) {
                Estoque estoque = new Estoque();
                estoque.setId(resultSet.getLong("id"));
                
                Produto produto = new Produto();
                produto.setNome(resultSet.getString("produto"));
                estoque.setProduto(produto);
                
                estoque.setQuantidade(resultSet.getInt("quantidade"));

                estoques.add(estoque);
            }
            return estoques;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao exibir todos os itens no estoque", e);
        }
    }

  
    @Override
    public Estoque exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

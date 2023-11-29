package controller.produto;

import controller.Controller;
import model.produto.Categoria;
import model.produto.Produto;
import Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProdutoController implements Controller<Produto> {
    private DBConnection dbConnection;

    public ProdutoController(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    @Override
    public boolean salvar(Produto produto) {
        try (
                Connection connection = dbConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO produto (CODIGOREFERENNCIA,DESCRICAO,CATEGORIA,UNIDADEMEDIDA) VALUES (?,?,?,?)")
        ) {
            preparedStatement.setString(1, produto.getCodigoReferencia());
            preparedStatement.setString(2, produto.getDescricao());
            preparedStatement.setLong(3, produto.getCategoria().getId());
            preparedStatement.setLong(4, produto.getUnidadeMedida().getId());
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar produto", e);
        }
    }

    @Override
    public List<Produto> exibirTodos() {
        try (
                Connection connection = dbConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM produto A" +
                        "INNER JOIN categoria B ON B.HANDLE = A.CATEGORIA" +
                        "INNER JOIN unidademedida C ON C.HANDLE = A.UNIDADEMEDIDA");
                ResultSet resultSet = preparedStatement.executeQuery()
        ) {
            List<Produto> produtos = new ArrayList<>();
            Map<Long, Produto> produtoMap = new HashMap<>();
            while (resultSet.next()) {
                Produto produto = new Produto();
                produto.setId(resultSet.getLong("ID"));
                produto.setCodigoReferencia(resultSet.getString("CODIGOREFERENCIA"));
                produto.setDescricao(resultSet.getString("DESCRICAO"));

                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getLong("id"));
                categoria.setDescricao(resultSet.getString("descricao"));
                produto.setCategoria(categoria);

                produtos.add(produto);
            }
            return produtos;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao exibir todos os produtos", e);
        }
    }

    @Override
    public Produto exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

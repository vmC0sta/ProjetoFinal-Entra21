package controller.produto;

import controller.Controller;
import model.produto.Categoria;
import Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaController implements Controller<Categoria> {
    private DBConnection dbConnection;

    public CategoriaController(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    @Override
    public boolean salvar(Categoria categoria) {
        try (
                Connection connection = dbConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "INSERT INTO categoria (descricao) VALUES (?)")
        ) {
            preparedStatement.setString(1, categoria.getDescricao());

            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar categoria", e);
        }
    }

    @Override
    public List<Categoria> exibirTodos() {
        try (
                Connection connection = dbConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "SELECT * FROM categoria");
                ResultSet resultSet = preparedStatement.executeQuery()
        ) {
            List<Categoria> categorias = new ArrayList<>();
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getLong("id"));
                categoria.setDescricao(resultSet.getString("descricao"));

                categorias.add(categoria);
            }
            return categorias;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao exibir todas as categorias", e);
        }
    }

    @Override
    public Categoria exibir(Long id) {
       
        return null;
    }

    @Override
    public void excluir(Long id) {
        
    }
}
package controller.produto;

import controller.Controller;
import model.produto.Produto;
import model.produto.UnidadeMedida;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Util.DBConnection;

public class UnidadeMedidaController implements Controller<UnidadeMedida> {
	
    private DBConnection dbConnection;

	public UnidadeMedidaController(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

	@Override
	public boolean salvar(UnidadeMedida unidadeMedida) {

		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("INSERT INTO UNIDADEMEDIDA (descricao,sigla) VALUES (?,?)")) {
			preparedStatement.setString(1, unidadeMedida.getDescricao());
			preparedStatement.setString(2, unidadeMedida.getSigla());
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar Unidade de medida", e);
		}
	}

	@Override
	public List<UnidadeMedida> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM UNIDADEMEDIDA");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<UnidadeMedida> medidas = new ArrayList<>();
			Map<Long, UnidadeMedida> medidaMap = new HashMap<>();
			while (resultSet.next()) {
				UnidadeMedida medida = new UnidadeMedida();
				medida.setId(resultSet.getLong("id"));
				medida.setDescricao(resultSet.getString("descricao"));
				medida.setSigla(resultSet.getString("sigla"));
				medidas.add(medida);
			}
			return medidas;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir todas as medidas", e);
		}
	}

	@Override
	public UnidadeMedida exibir(Long id) {
		
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM UNIDADEMEDIDA WHERE id = ?")) {
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			{
				UnidadeMedida medida = new UnidadeMedida();
				if (resultSet.next()) {
					medida.setId(resultSet.getLong("id"));
					medida.setDescricao(resultSet.getString("descricao"));
					medida.setSigla(resultSet.getString("sigla"));
				}
				return medida;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir medida", e);
		}
		
	}

	@Override
	public void excluir(Long id) {
		
		try(
				Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM UNIDADEMEDIDA WHERE = ?")){
					preparedStatement.setLong(1, id);

				}catch(SQLException e) {
					throw new RuntimeException("Erro ao excluir medida",e);
				}

	}
}

package controller.produto;

import controller.Controller;
import model.produto.UnidadeMedida;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar Unidade de medida", e);
		}
	}

	@Override
	public List<UnidadeMedida> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM UNIDADEMEDIDA");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<UnidadeMedida> medidas = new ArrayList<>();
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
						.prepareStatement("SELECT ID,DESCRICAO,SIGLA FROM unidademedida WHERE id = ?")) {
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			{
				UnidadeMedida unidadeMedida = new UnidadeMedida();
				if (resultSet.next()) {
					unidadeMedida.setId(resultSet.getLong("id"));
					unidadeMedida.setDescricao(resultSet.getString("descricao"));
					unidadeMedida.setSigla(resultSet.getString("sigla"));
				}
				return unidadeMedida;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir medida", e);
		}

	}

	@Override
	public boolean excluir(Long id) {

		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("DELETE FROM unidademedida WHERE ID = ?")) {
			preparedStatement.setLong(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao excluir medida", e);
		}

	}

	@Override
	public boolean editar(Long id, UnidadeMedida unidademedida) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE unidademedida "
						+ "SET DESCRICAO = ?  WHERE ID=?")) {
			preparedStatement.setString(1, unidademedida.getDescricao());
			preparedStatement.setLong(2, id);			
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao excluir o produto", e);
		}
	}
}

package controller.endereco;

import controller.Controller;
import model.endereco.Estado;
import model.endereco.Pais;
import model.pessoa.Pessoa;
import model.usuario.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Util.DBConnection;

public class EstadoController implements Controller<Estado> {

	DBConnection dbConnection;

	public EstadoController(DBConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	@Override
	public boolean salvar(Estado estado) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("INSERT INTO (DESCRICAO,PAIS_ID) VALUES (?,?)")) {
			preparedStatement.setString(1, estado.getDescricao());
			preparedStatement.setLong(2, estado.getPais().getId());
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar estado", e);
		} finally {
			dbConnection.closeConnection();
		}

	}

	@Override
	public List<Estado> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"SELECT A.ID, A.DESCRICAO, B.DESCRICAO FROM ESTADO A INNER JOIN PAIS B ON B.ID = A.PAIS_ID");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<Estado> estados = new ArrayList<>();
			while (resultSet.next()) {
				Estado estado = new Estado();
				estado.setId(resultSet.getLong("A.ID"));
				estado.setDescricao(resultSet.getString("A.DESCRICAO"));

				Pais pais = new Pais();
				pais.setDescricao(resultSet.getString("B.DESCRICAO"));

				estado.setPais(pais);

				estados.add(estado);
			}

			return estados;

		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir estados");
		} finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public Estado exibir(Long id) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT A.ID, A.DESCRICAO, B.DESCRICAO FROM ESTADO A INNER JOIN PAIS B ON B.ID = A.PAIS_ID WHERE a.ID = ?")) {
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			Estado estado= new Estado();
			if (resultSet.next()) {

				estado.setId(resultSet.getLong("A.ID"));
				estado.setDescricao(resultSet.getString("A.DESCRICAO"));
				Pais pais = new Pais();
				pais.setDescricao(resultSet.getString("B.DESCRICAO"));
				estado.setPais(pais);
			}
			return estado;

		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir estado", e);
		}finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public boolean excluir(Long id) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("DELETE FROM estado WHERE ID = ?")) {
			preparedStatement.setLong(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao excluir estado", e);
		} finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public boolean editar(Long id, Estado estado) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("UPDATE estado SET DESCRICAO=?,PAIS_ID=? WHERE ID = ?")) {
			preparedStatement.setString(1,estado.getDescricao());
			preparedStatement.setLong(2,estado.getPais().getId());
			preparedStatement.setLong(3, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao alterar estado", e);
		} finally {
			dbConnection.closeConnection();
		}
	}
}

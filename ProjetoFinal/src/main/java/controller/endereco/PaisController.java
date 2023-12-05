package controller.endereco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.endereco.*;
import model.pessoa.Pessoa;
import model.usuario.Usuario;
import controller.Controller;
import Util.DBConnection;

public class PaisController implements Controller<Pais> {

	private DBConnection dbConnection;

	public PaisController(DBConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	@Override
	public boolean salvar(Pais pais) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("INSERT INTO PAIS (DESCRICAO) VALUES (?)")) {
			preparedStatement.setString(1, pais.getDescricao());
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar o país");
		} finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public List<Pais> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT ID, DESCRICAO FROM PAIS");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<Pais> paises = new ArrayList<>();
			while (resultSet.next()) {
				Pais pais = new Pais();
				pais.setId(resultSet.getLong("ID"));
				pais.setDescricao(resultSet.getString("DESCRICAO"));
				paises.add(pais);
			}
			return paises;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir todos os países", e);
		} finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public Pais exibir(Long id) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT ID,DESCRICAO FROM pais WHERE id = ?")) {
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			Pais pais = new Pais();
			if (resultSet.next()) {

				pais.setId(resultSet.getLong("ID"));
				pais.setDescricao(resultSet.getString("DESCRICAO"));

			}
			return pais;

		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir usuario", e);
		} finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public boolean editar(Long id, Pais pais) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("UPDATE pais SET descricao = ? where id = ?")) {
			preparedStatement.setString(1, pais.getDescricao());
			preparedStatement.setLong(2, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao editar país", e);
		} finally {
			dbConnection.closeConnection();
		}

	}

	@Override
	public boolean excluir(Long id) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM pais WHERE id = ?")) {
			preparedStatement.setLong(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao excluir país", e);
		} finally {
			dbConnection.closeConnection();
		}

	}

}

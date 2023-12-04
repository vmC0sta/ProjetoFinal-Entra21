package controller.usuario;

import controller.Controller;
import model.usuario.Usuario;
import model.pessoa.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Util.DBConnection;

public class UsuarioController implements Controller<Usuario> {

	private DBConnection dbConnection;

	public UsuarioController(DBConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	@Override
	public boolean salvar(Usuario usuario) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("INSERT INTO USUARIO (NOME,SENHA,PESSOA_ID) VALUES (?,?,?)")) {
			preparedStatement.setString(1, usuario.getNome());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setLong(3, usuario.getPessoa().getId());
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar usuario", e);
		}
		finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public List<Usuario> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT A.ID,A.NOME,A.SENHA,B.NOME\r\n" + "FROM USUARIO A \r\n"
								+ "INNER JOIN pessoa B ON B.ID = A.PESSOA_id\r\n");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<Usuario> usuarios = new ArrayList<>();
			while (resultSet.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(resultSet.getLong("ID"));
				usuario.setNome(resultSet.getString("NOME"));
				usuario.setSenha(resultSet.getString("SENHA"));

				Pessoa pessoa = new Pessoa();
				pessoa.setNome(resultSet.getString("B.NOME"));

				usuario.setPessoa(pessoa);

				usuarios.add(usuario);
			}
			return usuarios;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir todos os Usuarios", e);
		}finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public Usuario exibir(Long id) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT A.ID,A.NOME,A.SENHA,B.ID,B.NOME FROM USUARIO A INNER JOIN PESSOA B ON B.ID = A.PESSOA_ID WHERE a.ID = ?")) {
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			Usuario usuario = new Usuario();
			if (resultSet.next()) {

				usuario.setId(resultSet.getLong("A.ID"));
				usuario.setNome(resultSet.getString("A.NOME"));
				usuario.setSenha(resultSet.getString("A.SENHA"));
				
				Pessoa pessoa = new Pessoa();
				pessoa.setId(resultSet.getLong("B.ID"));
				pessoa.setNome(resultSet.getString("B.NOME"));
				usuario.setPessoa(pessoa);

			}
			return usuario;

		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir usuario", e);
		}finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public boolean excluir(Long id) {

		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE"
						+ " FROM USUARIO WHERE ID = ?")) {
			preparedStatement.setLong(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao excluir usuario", e);
		}finally {
			dbConnection.closeConnection();
		}
	}

	@Override
	public boolean editar(Long id, Usuario usuario) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("UPDATE usuario " + "SET NOME=?, SENHA=?, PESSOA_id=? " + "WHERE ID=?")) {
			preparedStatement.setString(1, usuario.getNome());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setLong(3, usuario.getPessoa().getId());
			preparedStatement.setLong(4, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao editar usuario", e);
		}finally {
			dbConnection.closeConnection();
		}
	}
}

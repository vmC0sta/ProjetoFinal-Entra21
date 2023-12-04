package controller.usuario;

import controller.Controller;
import model.usuario.Usuario;
import model.pessoa.*;
import model.endereco.*;
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
						.prepareStatement("INSERT INTO USUARIO (NOME,SENHA,PESSOA) VALUES (?,?,?)")) {
			preparedStatement.setString(1, usuario.getNome());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setLong(3, usuario.getPessoa().getId());
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar usuario", e);
		}
	}

	@Override
	public List<Usuario> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM USUARIO");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<Usuario> usuarios = new ArrayList<>();
			while (resultSet.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(resultSet.getLong("ID"));
				usuario.setNome(resultSet.getString("NOME"));
				usuario.setSenha(resultSet.getString("SENHA"));

				Pessoa pessoa = new Pessoa();
				pessoa.setId(resultSet.getLong("ID"));
				pessoa.setNome(resultSet.getString("NOME"));
				pessoa.setTipoPessoa(TipoPessoa.valueOf(resultSet.getInt("CNPJCPF")));
				pessoa.setIdentificacao(resultSet.getString("IDENTIFICACAO"));
				pessoa.setTelefone(resultSet.getString("TELEFONE"));
				pessoa.setCelular(resultSet.getString("CELULAR"));
				pessoa.setInformacaoComplementar(resultSet.getString("IFOCOMPLEMAENTAR"));
				pessoa.setEmail(resultSet.getString("EMAIL"));

				Cargo cargo = new Cargo();
				cargo.setId(resultSet.getLong("ID"));
				cargo.setDescricao(resultSet.getString("descricao"));

				Pais pais = new Pais();
				pais.setId(resultSet.getLong("ID"));
				pais.setDescricao(resultSet.getString("DESCRICAO"));

				Estado estado = new Estado();
				estado.setId(resultSet.getLong("ID"));
				estado.setDescricao(resultSet.getString("DESCRICAO"));
				estado.setPais(pais);

				Municipio municipio = new Municipio();
				municipio.setId(resultSet.getLong("ID"));
				municipio.setDescricao(resultSet.getString("DESCRICAO"));
				municipio.setEstado(estado);

				Cep cep = new Cep();
				cep.setId(resultSet.getLong("ID"));
				cep.setCodigoPostal(resultSet.getString("DESCRICAO"));
				cep.setMunicipio(municipio);
				cep.setEstado(estado);
				cep.setPais(pais);

				Endereco endereco = new Endereco();
				endereco.setId(resultSet.getLong("ID"));
				endereco.setLogradouro(resultSet.getString("logradouro"));
				endereco.setNumero(resultSet.getString("numero"));
				endereco.setComplemento(resultSet.getString("complemento"));
				endereco.setMunicipio(municipio);
				endereco.setEstado(estado);
				endereco.setPais(pais);
				endereco.setCep(cep);

				pessoa.setEndereco(endereco);

				pessoa.setCargo(cargo);

				usuario.setPessoa(pessoa);

				usuarios.add(usuario);
			}
			return usuarios;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir todos os Usuarios", e);
		}
	}

	@Override
	public Usuario exibir(Long id) {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM USUARIO WHERE ID = ?")) {
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			{
				Usuario usuario = new Usuario();
				if (resultSet.next()) {

					usuario.setId(resultSet.getLong("ID"));
					usuario.setNome(resultSet.getString("NOME"));
					usuario.setSenha(resultSet.getString("SENHA"));

				}
				return usuario;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir usuario", e);
		}
	}

	@Override
	public boolean excluir(Long id) {

		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM USUARIO WHERE ID = ?")) {
			preparedStatement.setLong(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao excluir usuario", e);
		}

	}

	@Override
	public boolean editar(Long id, Usuario t) {
		// TODO Auto-generated method stub
		return false;
	}
}

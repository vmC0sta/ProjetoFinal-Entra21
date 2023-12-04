package controller.pessoa;

import controller.Controller;
import model.endereco.Cep;
import model.endereco.Endereco;
import model.endereco.Estado;
import model.endereco.Municipio;
import model.endereco.Pais;
import model.pessoa.Cargo;
import model.pessoa.Pessoa;
import model.pessoa.TipoPessoa;
import model.usuario.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Util.DBConnection;

public class PessoaController implements Controller<Pessoa> {
	
	private DBConnection dbConnection;

	public PessoaController(DBConnection dbConnection) {
		this.dbConnection = dbConnection;
	}
	
    @Override
    public boolean salvar(Pessoa pessoa) {
        return false;
    }

    @Override
    public List<Pessoa> exibirTodos() {
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM pessoa");
				ResultSet resultSet = preparedStatement.executeQuery()) {
			List<Pessoa> pessoas = new ArrayList<>();
			while (resultSet.next()) {
				
				Pessoa pessoa = new Pessoa();
				pessoa.setId(resultSet.getLong("ID"));
				pessoa.setNome(resultSet.getString("NOME"));
				pessoa.setTipoPessoa(TipoPessoa.valueOf(resultSet.getInt("CNPJCPF")));
				pessoa.setIdentificacao(resultSet.getString("IDENTIFICACAO"));
				pessoa.setTelefone(resultSet.getString("TELEFONE"));
				pessoa.setCelular(resultSet.getString("CELULAR"));
				pessoa.setInformacaoComplementar(resultSet.getString("INFOCOMPLEMENTAR"));
				pessoa.setEmail(resultSet.getString("EMAIL"));
				
				pessoas.add(pessoa);
			}
			return pessoas;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao exibir todos os Usuarios", e);
		}
    }

    @Override
    public Pessoa exibir(Long id) {
        return null;
    }

    @Override
    public boolean excluir(Long id) {
    	return true;
    }

	@Override
	public boolean editar(Long id, Pessoa t) {
		// TODO Auto-generated method stub
		return false;
	}
}

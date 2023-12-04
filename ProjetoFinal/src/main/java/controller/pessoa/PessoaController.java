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
        try (Connection connection = dbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM pessoa " +
                    "LEFT JOIN cargo ON pessoa.idcargo = cargo.id " +
                    "LEFT JOIN endereco ON pessoa.idendereco = endereco.id " +
                    "LEFT JOIN cep ON endereco.idcep = cep.id " +
                    "LEFT JOIN municipio ON endereco.idmunicipio = municipio.id " +
                    "LEFT JOIN estado ON municipio.idestado = estado.id " +
                    "LEFT JOIN pais ON estado.idpais = pais.id " +
                    "WHERE pessoa.id = ?");
        ) {
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Pessoa pessoa = new Pessoa();
                pessoa.setId(resultSet.getLong("id"));
                pessoa.setNome(resultSet.getString("nome"));
                pessoa.setTipoPessoa(TipoPessoa.valueOf(resultSet.getInt("cnpjcpf")));
                pessoa.setIdentificacao(resultSet.getString("identificacao"));
                pessoa.setTelefone(resultSet.getString("telefone"));
                pessoa.setCelular(resultSet.getString("celular"));
                pessoa.setInformacaoComplementar(resultSet.getString("infocomplementar"));
                pessoa.setEmail(resultSet.getString("email"));

               
                Cargo cargo = new Cargo();
                cargo.setId(resultSet.getLong("idcargo"));
                cargo.setDescricao(resultSet.getString("descricao_cargo"));
                pessoa.setCargo(cargo);

            
                Endereco endereco = new Endereco();
                endereco.setId(resultSet.getLong("idendereco"));
                endereco.setLogradouro(resultSet.getString("logradouro"));
                endereco.setNumero(resultSet.getString("numero"));
                endereco.setComplemento(resultSet.getString("complemento"));

               
                Pais pais = new Pais();
                pais.setId(resultSet.getLong("idpais"));
                pais.setDescricao(resultSet.getString("descricao_pais"));

                
                Estado estado = new Estado();
                estado.setId(resultSet.getLong("idestado"));
                estado.setDescricao(resultSet.getString("descricao_estado"));

               
                Municipio municipio = new Municipio();
                municipio.setId(resultSet.getLong("idmunicipio"));
                municipio.setDescricao(resultSet.getString("descricao_municipio"));

               
                Cep cep = new Cep();
                cep.setId(resultSet.getLong("idcep"));
                cep.setCodigoPostal(resultSet.getString("codigo_postal"));
                cep.setMunicipio(municipio);
                cep.setEstado(estado);
                cep.setPais(pais);

                endereco.setCep(cep);

                pessoa.setEndereco(endereco);

                return pessoa;
            } else {
                return null; 
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao exibir Pessoa por ID", e);
        }
    }


    @Override
    public boolean excluir(Long id) {
    	   try (Connection connection = dbConnection.getConnection();
    	             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM pessoa WHERE id = ?")
    	        ) {
    	            preparedStatement.setLong(1, id);
    	            int rowsDeleted = preparedStatement.executeUpdate();

    	            return rowsDeleted > 0; 
    	        } catch (SQLException e) {
    	            throw new RuntimeException("Erro ao excluir Pessoa por ID", e);
    	        }
    	    }

    @Override
    public boolean editar(Long id, Pessoa pessoa) {
        try (Connection connection = dbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE pessoa " +
                             "SET nome = ?, cnpjcpf = ?, identificacao = ?, telefone = ?, celular = ?, " +
                             "infocomplementar = ?, email = ? " +
                             "WHERE id = ?");
        ) {
            preparedStatement.setString(1, pessoa.getNome());
            preparedStatement.setInt(2, pessoa.getTipoPessoa().ordinal());
            preparedStatement.setString(3, pessoa.getIdentificacao());
            preparedStatement.setString(4, pessoa.getTelefone());
            preparedStatement.setString(5, pessoa.getCelular());
            preparedStatement.setString(6, pessoa.getInformacaoComplementar());
            preparedStatement.setString(7, pessoa.getEmail());
            preparedStatement.setLong(8, id);

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao editar Pessoa", e);
        }
    }
}
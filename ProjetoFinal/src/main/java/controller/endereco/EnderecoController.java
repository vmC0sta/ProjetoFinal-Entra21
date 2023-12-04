package controller.endereco;

import controller.Controller;
import model.endereco.Endereco;

import java.util.List;

public class EnderecoController implements Controller<Endereco> {

    @Override
    public boolean salvar(Endereco endereco) {
        return false;
    }

    @Override
    public List<Endereco> exibirTodos() {
        return null;
    }

    @Override
    public Endereco exibir(Long id) {
        return null;
    }

    @Override
    public boolean excluir(Long id) {
    	return false;
    }

	@Override
	public boolean editar(Long id, Endereco t) {
		// TODO Auto-generated method stub
		return false;
	}
}

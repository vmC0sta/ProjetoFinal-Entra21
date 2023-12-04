package controller.endereco;

import controller.Controller;

import java.util.List;

public class CepController<Cep> implements Controller<Cep> {
    @Override
    public boolean salvar(Cep cep) {
        return false;
    }

    @Override
    public List<Cep> exibirTodos() {
        return null;
    }

    @Override
    public Cep exibir(Long id) {
        return null;
    }

    @Override
    public boolean excluir(Long id) {
    	return false;
    }

	@Override
	public boolean editar(Long id, Cep t) {
		// TODO Auto-generated method stub
		return false;
	}
}

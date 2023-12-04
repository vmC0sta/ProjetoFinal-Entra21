package controller.endereco;

import controller.Controller;
import model.endereco.Estado;

import java.util.List;

public class EstadoController implements Controller<Estado> {
    @Override
    public boolean salvar(Estado estado) {
        return false;
    }

    @Override
    public List<Estado> exibirTodos() {
        return null;
    }

    @Override
    public Estado exibir(Long id) {
        return null;
    }

    @Override
    public boolean excluir(Long id) {
    	return false;
    }

	@Override
	public boolean editar(Long id, Estado t) {
		// TODO Auto-generated method stub
		return false;
	}
}

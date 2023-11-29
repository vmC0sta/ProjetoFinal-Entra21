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
    public Estado exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

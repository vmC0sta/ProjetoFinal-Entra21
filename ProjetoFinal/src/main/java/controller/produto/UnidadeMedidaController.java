package controller.produto;

import controller.Controller;
import model.produto.UnidadeMedida;

import java.util.List;

public class UnidadeMedidaController implements Controller<UnidadeMedida> {

    @Override
    public boolean salvar(UnidadeMedida unidadeMedida) {
        return false;
    }

    @Override
    public List<UnidadeMedida> exibirTodos() {
        return null;
    }

    @Override
    public UnidadeMedida exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

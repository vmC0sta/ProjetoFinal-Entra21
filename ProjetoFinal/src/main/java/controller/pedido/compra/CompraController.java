package controller.pedido.compra;

import controller.Controller;
import model.pedido.compra.Compra;

import java.util.List;

public class CompraController implements Controller<Compra> {
    @Override
    public boolean salvar(Compra compra) {
        return false;
    }

    @Override
    public List<Compra> exibirTodos() {
        return null;
    }

    @Override
    public Compra exibir(Long id) {
        return null;
    }

    @Override
    public void excluir(Long id) {

    }
}

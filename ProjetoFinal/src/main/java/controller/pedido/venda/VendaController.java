package controller.pedido.venda;

import controller.Controller;
import model.pedido.venda.Venda;

import java.util.List;

public class VendaController implements Controller<Venda> {
    @Override
    public boolean salvar(Venda venda) {
        return false;
    }

    @Override
    public List<Venda> exibirTodos() {
        return null;
    }

    @Override
    public Venda exibir(Long id) {
        return null;
    }

    @Override
    public void excluir(Long id) {

    }
}

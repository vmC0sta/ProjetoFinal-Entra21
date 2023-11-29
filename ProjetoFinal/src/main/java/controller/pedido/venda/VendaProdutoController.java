package controller.pedido.venda;

import controller.Controller;
import model.pedido.venda.VendaProduto;

import java.util.List;

public class VendaProdutoController implements Controller<VendaProduto> {
    @Override
    public boolean salvar(VendaProduto vendaProduto) {
        return false;
    }

    @Override
    public List<VendaProduto> exibirTodos() {
        return null;
    }

    @Override
    public VendaProduto exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

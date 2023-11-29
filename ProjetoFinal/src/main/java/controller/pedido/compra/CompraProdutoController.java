package controller.pedido.compra;

import controller.Controller;
import model.pedido.compra.CompraProduto;

import java.util.List;

public class CompraProdutoController implements Controller<CompraProduto> {
    @Override
    public boolean salvar(CompraProduto compraProduto) {
        return false;
    }

    @Override
    public List<CompraProduto> exibirTodos() {
        return null;
    }

    @Override
    public CompraProduto exibir(Long id) {
        return null;
    }

    @Override
    public void excluir(Long id) {

    }
}

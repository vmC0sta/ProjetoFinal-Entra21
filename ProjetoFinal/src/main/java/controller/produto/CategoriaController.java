package controller.produto;

import controller.Controller;
import model.produto.Categoria;

import java.util.List;

public class CategoriaController implements Controller<Categoria> {
    @Override
    public boolean salvar(Categoria categoria) {
        return false;
    }

    @Override
    public List<Categoria> exibirTodos() {
        return null;
    }

    @Override
    public Categoria exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

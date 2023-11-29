package controller.usuario;

import controller.Controller;
import model.usuario.Usuario;

import java.util.List;

public class UsuarioController implements Controller<Usuario> {
    @Override
    public boolean salvar(Usuario usuario) {
        return false;
    }

    @Override
    public List<Usuario> exibirTodos() {
        return null;
    }

    @Override
    public Usuario exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}

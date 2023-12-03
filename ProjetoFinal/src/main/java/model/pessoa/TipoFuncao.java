package model.pessoa;

public enum TipoFuncao {
    EHCLIENTE(1),
    EHFUNCIONARIO(2),
    EHVENDEDOR(3),;
    
    private final int valor;

    TipoFuncao(int valor) {
        this.valor = valor;
    }

    public int getValor() {
        return valor;
    }

    public static TipoFuncao valueOf(int valor) {
        for (TipoFuncao tipo : values()) {
            if (tipo.valor == valor) {
                return tipo;
            }
        }
        throw new IllegalArgumentException("Valor inválido para o tipo de funcao: " + valor);
    }
}


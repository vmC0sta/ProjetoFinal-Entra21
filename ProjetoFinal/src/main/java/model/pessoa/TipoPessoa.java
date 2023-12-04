package model.pessoa;

public enum TipoPessoa {
    CNPJ(0),
    CPF(1),;
	
    private final int valor;

    TipoPessoa(int valor) {
        this.valor = valor;
    }

    public int getValor() {
        return valor;
    }

    public static TipoPessoa valueOf(int valor) {
        for (TipoPessoa tipo : values()) {
            if (tipo.valor == valor) {
                return tipo;
            }
        }
        throw new IllegalArgumentException("Valor inválido para tipo de pessoa: " + valor);
    }
}



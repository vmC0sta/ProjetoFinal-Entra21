package model.endereco;

public class Endereco {
    private Long id;
    private String logradouro;
    private String numero;
    private String complemento;
    private Municipio municipio;
    private Estado estado;
    private Pais pais;
    private Cep cep;

    public Endereco() {
    }

    public Endereco(String logradouro, String numero, String complemento, Municipio municipio, Estado estado, Pais pais, Cep cep) {
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.municipio = municipio;
        this.estado = estado;
        this.pais = pais;
        this.cep = cep;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public Municipio getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public Cep getCep() {
        return cep;
    }
    public void setCep(Cep cep) {
        this.cep = cep;
    }

    @Override
    public String toString() {
        return "Endereco{" +
                "id=" + id +
                ", logradouro='" + logradouro + '\'' +
                ", numero='" + numero + '\'' +
                ", complemento='" + complemento + '\'' +
                ", municipio=" + municipio +
                ", estado=" + estado +
                ", pais=" + pais +
                ", cep=" + cep +
                '}';
    }
}

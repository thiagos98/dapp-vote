pragma solidity ^0.8.13;


contract ExemploContrato {
    
    struct Pessoa {
        uint idade;
        string nome;
    }
    
    mapping (address => Pessoa) pessoas;
    address[] pessoaLista;
    
    
    function setPessoa(address _address, uint _idade, string memory _nome) public {
        
        Pessoa memory pessoa;
        
        pessoa.idade = _idade;
        pessoa.nome = _nome;
    
        pessoas[_address] = pessoa;
        
        pessoaLista.push(_address);
    }
    
    function getPessoas() view public returns (address[] memory) {
        return pessoaLista;
    }
    
    function getPessoa(address _address) view public returns (uint idade, string memory nome) {
        Pessoa memory p = pessoas[_address];
        
        return (p.idade, p.nome);
    }
    
    function totalDePessoas() view public returns (uint) {
        return pessoaLista.length;
    }
}
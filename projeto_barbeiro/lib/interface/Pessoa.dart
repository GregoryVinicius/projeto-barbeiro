import 'package:projeto_barbeiro/cpf.dart';
import 'package:projeto_barbeiro/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/interface/i_dao_pessoa.dart';

class Pessoa {
  late String nome;
  String? email;
  late int idade;
  late String numeroTelefone;
  late String cpf;
  late String senha;

  // Pessoa({required this.nome, required this.idade, required this.cpf, required this.numeroTelefone, required this.senha,});

  late IDAOPessoa dao;
  late DTOPessoa dto;

  Pessoa({required this.dto, required this.dao}) {
    nome = dto.nome;
    email = dto.email;
    idade = dto.idade;
    cpf = dto.cpf;
    senha = dto.senha;
    numeroTelefone = dto.numeroTelefone!;
  }

  DTOPessoa salvar(DTOPessoa dto) {
    return dao.salvar(dto);
  }

  bool validarTelefone() {
    return numeroTelefone.length >= 10 && numeroTelefone.length <= 11;
  }

  // Método para validar a senha
  bool validarSenha() {
    if (senha.isEmpty) {
      return false;
    }
    bool temLetraMaiuscula = senha.contains(RegExp(r'[A-Z]'));
    bool temLetraMinuscula = senha.contains(RegExp(r'[a-z]'));
    bool temNumeros = senha.contains(RegExp(r'[0-9]'));
    bool temCaractereEspecial = senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool temTamanhoMinimo = senha.length >= 8;

    return temLetraMaiuscula &&
        temLetraMinuscula &&
        temNumeros &&
        temCaractereEspecial &&
        temTamanhoMinimo;
  }
}

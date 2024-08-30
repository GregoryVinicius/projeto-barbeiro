import 'package:projeto_barbeiro/dominio/cpf.dart';
import 'package:projeto_barbeiro/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/dominio/interface/i_dao_pessoa.dart';

class Pessoa {
  late String nome;
  String? email;
  late int idade;
  String? numeroTelefone;
  late String cpf;
  late String senha;

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

  // Método para validar a senha
  bool validarSenha() {
    if (senha.isEmpty) {
      return false;
    }
    bool temLetraMaiuscula = senha.contains(RegExp(r'[A-Z]'));
    bool temLetraMinuscula = senha.contains(RegExp(r'[a-z]'));
    bool temNumeros = senha.contains(RegExp(r'[0-9]'));
    bool temCaractereEspecial =
        senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool temTamanhoMinimo = senha.length >= 8;

    return temLetraMaiuscula &&
        temLetraMinuscula &&
        temNumeros &&
        temCaractereEspecial &&
        temTamanhoMinimo;
  }
}

import 'package:projeto_barbeiro/app/banco/sqlite/dao_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/Pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_pessoa.dart';

class APPessoa {
  late IDAOPessoa dao;
  late Pessoa dominio;

  APPessoa() {
    dao = DaoPessoa();
  }

   Future<DTOPessoa> salvar(DTOPessoa dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOPessoa> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio.alterar(id);
    return true;
  }

  Future<List<DTOPessoa>> consultar() async {
    return await dominio.consutlar();
  }
}

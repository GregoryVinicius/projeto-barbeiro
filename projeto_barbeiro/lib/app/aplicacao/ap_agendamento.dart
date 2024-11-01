import 'package:projeto_barbeiro/app/banco/sqlite/dao_agendamento.dart';
import 'package:projeto_barbeiro/app/dominio/agendamento.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_agendamento.dart';

class APAgendamento {
  late DAOAgendamento dao;
  late Agendamento dominio;

  APAgendamento() {
    dao = DAOAgendamento();
    dominio = Agendamento(dao: dao);
  }

  Future<DTOAgendamento> salvar(DTOAgendamento dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOAgendamento> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio.alterar(id);
    return true;
  }

  Future<List<DTOAgendamento>> consulta() async {
    return await dominio.consulta();
  }
}

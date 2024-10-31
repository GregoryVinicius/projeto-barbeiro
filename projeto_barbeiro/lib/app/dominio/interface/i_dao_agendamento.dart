import 'package:projeto_barbeiro/app/dominio/dto/dto_agendamento.dart';

abstract class IDAOAgendamento {
  Future<DTOAgendamento> salvar(DTOAgendamento dto);
  Future<DTOAgendamento> alterar(DTOAgendamento dto);
  Future<DTOAgendamento> consultarPorId(int id);
  Future<List<DTOAgendamento>> consultar();
}
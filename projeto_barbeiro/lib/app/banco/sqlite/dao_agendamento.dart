import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_agendamento.dart';
import 'package:sqflite/sqflite.dart';

class DAOAgendamento implements IDAOAgendamento {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) 
    VALUES (?,?,?,?,?,?)
  ''';

  final sqlAlterar = '''
    UPDATE agendamento SET cliente_id=?, profissional_id=?, data_hora=?, servico=?, duracao=?, status=?
    WHERE id=?
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM agendamento WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM agendamento;
  ''';

  @override
  Future<DTOAgendamento> salvar(DTOAgendamento dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [
      dto.clienteId,
      dto.profissionalId,
      dto.dataHora,
      dto.servico,
      dto.duracao,
      dto.status
    ]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOAgendamento> alterar(DTOAgendamento dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [
      dto.clienteId,
      dto.profissionalId,
      dto.dataHora,
      dto.servico,
      dto.duracao,
      dto.status
    ]);
    return dto;
  }

  @override
  Future<DTOAgendamento> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOAgendamento agendamento = DTOAgendamento(
        clienteId: resultado['cliente_id'].hashCode,
        profissionalId: resultado['profissional_id'].hashCode,
        dataHora: DateTime.parse(resultado['data_hora'] as String),
        servico: resultado['servico'].toString(),
        duracao: Duration(minutes: resultado['duracao'] as int),
        status: resultado['status'].toString());
    return agendamento;
  }

  @override
  Future<List<DTOAgendamento>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOAgendamento> agendamento = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOAgendamento(
          clienteId: linha['cliente_id'].hashCode,
          profissionalId: linha['profissional_id'].hashCode,
          dataHora: DateTime.parse(linha['data_hora'] as String),
          servico: linha['servico'].toString(),
          duracao: Duration(minutes: linha['duracao'] as int),
          status: linha['status'].toString());
    });
    return agendamento;
  }
}

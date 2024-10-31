import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_agendamento.dart';
import 'package:sqflite/sqflite.dart';

class DAOAgendamento implements IDAOAgendamento{
  late Database _db;

  final sqlInserir = '''
    INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) 
    VALUES (?,?,?,?,?,?)
  '''

  final sqlAlterar = '''
    UPDATE agendamento SET cliente_id=?, profissional_id=?, data_hora=?, servico=?, duracao=?, status=?
    WHERE id=?
  '''

    final sqlConsultarPorId = '''
    SELECT * FROM agendamento WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM agendamento;
  ''';

  @override
  Future<DTOAgendamento> salvar(DTOAgendamento dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.cliente_id, dto.profissional_id, dto.data_hora, dto.servico, dto.duracao, dto.status]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOAgendamento> alterar(DTOAgendamento dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.cliente_id, dto.profissional_id, dto.data_hora, dto.servico, dto.duracao, dto.status]);
    return dto;
  }

  @override
  Future<DTOAgendamento> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOAgendamento agendamento = DTOAgendamento(
        cliente_id: resultado['cliente_id'].hashCode,
        profissional_id: resultado['profissional_id'].hashCode,
        data_hora: resultado['data_hora'].toDatetime(),
        servico: resultado['servico'].toString(),
        duracao: resultado['duracao'].hashCode,
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
        cliente_id: linha['cliente_id'].hashCode,
        profissional_id: linha['profissional_id'].hashCode,
        data_hora: linha['data_hora'].toDatetime(),
        servico: linha['servico'].toString(),
        duracao: linha['duracao'].hashCode,
        status: linha['status'].toString());
    });
    return agendamento;
  }
}
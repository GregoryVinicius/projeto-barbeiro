import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_pessoa.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DaoProfessor implements IDAOPessoa {
  late Database _db;

  @override
  Future<DTOPessoa> salvar(DTOPessoa dto) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(
        'INSERT INTO professor (nome, cpf) VALUES (?,?,?,?),',
        [dto.nome, dto.cpf]);
    dto.id = id;
    return dto;
  }
}

import 'package:projeto_barbeiro/app/banco/sqlite/conexao.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_pessoa.dart';
import 'package:sqflite/sqflite.dart';

class DaoPessoa implements IDAOPessoa {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO pessoa (nome, idade , numeroTelefone, email, cpf, senha)
    VALUES (?,?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE professor SET nome=?, idade=?, numeroTelefone=?, email=?, cpf=?
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM pessoa WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM professor;
  ''';

  @override
  Future<DTOPessoa> salvar(DTOPessoa dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.nome, dto.idade, dto.numeroTelefone, dto.email, dto.cpf]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOPessoa> alterar(DTOPessoa dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.idade, dto.numeroTelefone, dto.email, dto.cpf]);
    return dto;
  }

  @override
  Future<DTOPessoa> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOPessoa professor = DTOPessoa(
        nome: resultado['nome'].toString(),
        idade: resultado['idade'].hashCode,
        numeroTelefone: resultado['numeroTelefone'].toString(),
        email: resultado['email'].toString(),
        cpf: resultado['CPF'].toString(),
        senha: resultado['senha'].toString());
    return professor;
  }
  //   CREATE TABLE pessoa(
  //   id INTEGER NOT NULL PRIMARY KEY
  //   ,nome VARCHAR(200) NOT NULL
  //   ,idade integer NOT NULL
  //   ,numeroTelefone VARCHAR(16) NOT NULL
  //   ,email VARCHAR(200)
  //   ,cpf CHAR(14) NOT NULL UNIQUE
  //   ,senha VARCHAR(200) NOT NULL
  // )

  @override
  Future<List<DTOPessoa>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOPessoa> pessoas = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOPessoa(
          nome: linha['nome'].toString(),
          idade: linha['idade'].hashCode,
          numeroTelefone: linha['numeroTelefone'].toString(),
          email: linha['email'].toString(),
          cpf: linha['CPF'].toString(),
          senha: linha['senha'].toString());
    });
    return pessoas;
  }
  
  @override
  Future<bool> alterarStatus(int id) {
    // TODO: implement alterarStatus
    throw UnimplementedError();
  } // precisa arrumar isso
}

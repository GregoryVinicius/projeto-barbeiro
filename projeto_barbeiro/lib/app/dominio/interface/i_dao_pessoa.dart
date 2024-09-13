import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';

abstract class IDAOPessoa {
  Future<DTOPessoa> salvar(DTOPessoa dto);
  Future<DTOPessoa> alterar(DTOPessoa dto);
  Future<bool> alterarStatus(int id);
  Future<DTOPessoa> consultarPorId(int id);
  Future<List<DTOPessoa>> consultar();
}

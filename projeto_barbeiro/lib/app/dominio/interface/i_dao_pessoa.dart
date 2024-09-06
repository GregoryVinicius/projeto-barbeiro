import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';

abstract class IDAOPessoa {
  Future<DTOPessoa> salvar(DTOPessoa dto);
}

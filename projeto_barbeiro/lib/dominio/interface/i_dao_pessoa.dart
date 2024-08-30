import 'package:projeto_barbeiro/dominio/dto/dto_pessoa.dart';

abstract class IDAOPessoa {
  DTOPessoa salvar(DTOPessoa dto);
}

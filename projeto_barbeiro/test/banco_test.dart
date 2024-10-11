import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:projeto_barbeiro/app/banco/script.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group("Banco", () {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    test("Teste se banco esta sendo criado", () {
      criarTabelas;
    });
    test("inserir registros", () {
      inserirRegistros;
    });
    test("Iniciar banco", () {
      Conexao.iniciar();
    });
  });
}

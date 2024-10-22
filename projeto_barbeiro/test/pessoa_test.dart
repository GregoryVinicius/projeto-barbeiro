import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_barbeiro/app/dominio/Cliente.dart';
import 'package:projeto_barbeiro/app/dominio/cpf.dart';

void main() {
  group("Cliente", () {
    group("CPF", () {
      CPF cpf = CPF("123.456.789-10");
      test('teste cpf não vazio', () {
        expect(() => cpf.eVazio('858.827.500-75'), returnsNormally);
      });
    });
    group('Senha', () {
      String senha = "aA1!aaaa";
      test('Senha com todos requerimentos', () {
        expect(() => Cliente.ValidarSenha(senha), returnsNormally);
      });
    });
  });
}

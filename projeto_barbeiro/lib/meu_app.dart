import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/rotas.dart';
import 'package:projeto_barbeiro/app/widget/lista_pessoa.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gestão de horas de barbeiro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          Rotas.home: (context) => ListaPessoa(),
          Rotas.formPessoas: (context) => FromPessoas(),
          Rotas.detalhesPessoas: (context) => DetalhesPessoas()
        });
  }
}

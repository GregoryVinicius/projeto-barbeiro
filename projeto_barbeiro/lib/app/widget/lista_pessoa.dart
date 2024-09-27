import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/aplicacao/ap_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/rotas.dart';

class ListaPessoa extends StatelessWidget {
  Future<List<DTOPessoa>> consultar() async {
    return [
      DTOPessoa(
          nome: 'Roger Silva',
          cpf: '111.111.111-11',
          idade: 18,
          email: 'Roger@email.com',
          senha: 'aA1!aaaa',
          numeroTelefone: '11-91234-5678'),
      DTOPessoa(
          nome: 'Maria Oliveira',
          cpf: '222.222.222-22',
          idade: 25,
          email: 'maria@email.com',
          senha: 'bB2!bbbb',
          numeroTelefone: '11-92345-6789'),
      DTOPessoa(
          nome: 'Carlos Santos',
          cpf: '333.333.333-33',
          idade: 30,
          email: 'carlos@email.com',
          senha: 'cC3!cccc',
          numeroTelefone: '11-93456-7890')
    ];
  }

  var aplicacao = APPessoa();

  Widget CriarBotao(BuildContext context, String rota, String rotulo) {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, rota),
        child: Text(rotulo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista Pessoa'),
      ),
      body: FutureBuilder(
          future: aplicacao.consultar(),
          builder:
              (BuildContext context, AsyncSnapshot<List<DTOPessoa>> consulta) {
            var dados = consulta.data;
            if (dados == null) {
              return Text('dados não encontrados');
            } else {
              List<DTOPessoa> lista = dados;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    var pessoa = lista[index];
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(pessoa.nome),
                      subtitle: Text(pessoa.cpf),
                    );
                  });
            }
          }),
    );
    // return Container(
    //   child: Column(
    //     children: [
    //       TextButton(
    //           onPressed: () =>
    //               Navigator.pushNamed(context, Rotas.detalhesPessoas),
    //           child: Text('detalhes')),
    //       TextButton(
    //           onPressed: () => Navigator.pushNamed(context, Rotas.formPessoas),
    //           child: Text('Formulário')),
    //     ],
    //   ),
    // );
  }
}

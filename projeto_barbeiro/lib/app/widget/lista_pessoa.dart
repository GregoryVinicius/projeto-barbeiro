import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/aplicacao/ap_cliente.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/rotas.dart';

class ListaCliente extends StatelessWidget {
  Future<List<DTOCliente>> consultar() async {
    APCliente aplicacao = APCliente();
    print("Aqui instanciou o Ao cliente e i´ra fazer a requisição");
    return await aplicacao.consultar();
  }

  Widget CriarBotao(BuildContext context, String rota, String rotulo) {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, rota),
        child: Text(rotulo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista Cliente'),
      ),
      body: FutureBuilder(
          future: consultar(),
          builder:
              (BuildContext context, AsyncSnapshot<List<DTOCliente>> consulta) {
            var dados = consulta.data;
            if (dados == null) {
              return Text('dados não encontrados');
            } else {
              List<DTOCliente> lista = dados;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    var Cliente = lista[index];
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(Cliente.nome),
                      subtitle: Text(Cliente.cpf),
                    );
                  });
            }
          }),
    );
  }
}

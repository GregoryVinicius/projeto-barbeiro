import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/aplicacao/ap_agendamento.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_barbeiro/app/rotas.dart';

class ListaAgendamento extends StatefulWidget {
  _ListaAgendamentoState createState() => _ListaAgendamentoState();
}

class _ListaAgendamentoState extends State<ListaAgendamento> {
  late Future<List<DTOAgendamento>> _futureAgendamentos;

  @override
  void initState() {
    super.initState();
    _futureAgendamentos = consultar();
  }

  Future<List<DTOAgendamento>> consultar() async {
    APAgendamento aplicacao = APAgendamento();
    print("Aqui instanciou o APCliente e irá fazer a requisição");
    return await aplicacao.consulta();
  }

  Widget CriarBotao(String rotulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(rotulo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Agendamentos'),
      ),
      body: FutureBuilder(
          future: _futureAgendamentos,
          builder: (BuildContext context,
              AsyncSnapshot<List<DTOAgendamento>> consulta) {
            if (consulta.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (consulta.hasError) {
              return Text('Erro: ${consulta.error}');
            } else if (!consulta.hasData || consulta.data!.isEmpty) {
              return Text('Dados não encontrados');
            } else {
              List<DTOAgendamento> lista = consulta.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          var agendamento = lista[index];
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text(agendamento.clienteId),
                            subtitle: Text(agendamento.servico),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CriarBotao("Cadastrar Novo Agendamento", () {
                      Navigator.pushNamed(context, Rotas.formAgendamento);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CriarBotao("Atualizar", () {
                      setState(() {
                        _futureAgendamentos = consultar();
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CriarBotao("Lista Cliente", () {
                      Navigator.pushNamed(context, Rotas.listaAgendamento);
                    }),
                  )
                ],
              );
            }
          }),
    );
  }
}

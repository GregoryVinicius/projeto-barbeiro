import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/aplicacao/ap_agendamento.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_agendamento.dart';

class FormAgendamento extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _clienteIdController = TextEditingController();
    final _profissionalIdController = TextEditingController();
    final _dataHoraController = TextEditingController();
    final _servicoController = TextEditingController();
    final _duracaoController = TextEditingController();
    final _statusController = TextEditingController();

    void _criarAgendamento() async {
      if (_formKey.currentState!.validate()) {
        final clienteIdTexto = _clienteIdController.text;
        final profissionalIdTexto = _profissionalIdController.text;
        final dataHoraTexto = _dataHoraController.text;
        final servico = _servicoController.text;
        final duracaoTexto = _duracaoController.text;
        final status = _statusController.text;

        int? clienteId = int.tryParse(clienteIdTexto);
        int? profissionalId = int.tryParse(profissionalIdTexto);
        int? duracao = int.tryParse(duracaoTexto);

        DTOAgendamento dto = DTOAgendamento(
          clienteId: clienteId!,
          profissionalId: profissionalId!,
          dataHora: DateTime.parse(dataHoraTexto),
          servico: servico,
          duracao: Duration(minutes: duracao!),
          status: status,
        );

        APAgendamento apAgendamento = APAgendamento();
        await apAgendamento.salvar(dto);

        _clienteIdController.clear();
        _profissionalIdController.clear();
        _dataHoraController.clear();
        _servicoController.clear();
        _duracaoController.clear();
        _statusController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Agendamento salvo com sucesso')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _clienteIdController,
                decoration: InputDecoration(labelText: 'ID do Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ID do Cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _profissionalIdController,
                decoration: InputDecoration(labelText: 'ID do Profissional'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ID do Profissional';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dataHoraController,
                decoration: InputDecoration(
                    labelText: 'Data e Hora (AAAA-MM-DD HH:MM:SS)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a data e hora do agendamento';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _servicoController,
                decoration: InputDecoration(labelText: 'Serviço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o serviço a ser realizado';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _duracaoController,
                decoration: InputDecoration(labelText: 'Duração (em minutos)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a duração do serviço';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _statusController,
                decoration: InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o status do agendamento';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _criarAgendamento,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Agendamento {
  final int clienteId;
  final int profissionalId;
  final DateTime dataHora;
  final Duration duracao;
  final String servico;
  String status;
  IDAOAgendamento dao;

  Agendamento({
    required this.clienteId,
    required this.profissionalId,
    required this.dataHora,
    required this.duracao,
    required this.servico,
    this.status = 'agendado',
  });

  DateTime get termino => dataHora.add(duracao);

  bool conflitaCom(Agendamento outroServico) {
    return dataHora.isBefore(outro.termino) && termino.isAfter(outro.dataHora);
  }
}
/*
  O Cliente pode agendar horário de corte de cabelo ou barba:

  O sistema deve permitir que o Cliente selecione serviços de corte de cabelo, barba ou ambos, também selecionando
  opção de pagamento no app ou no estabelecimento.

  O agendamento deve ser confirmado com uma mensagem de sucesso.
*/
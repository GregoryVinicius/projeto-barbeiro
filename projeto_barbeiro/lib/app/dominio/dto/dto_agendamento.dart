class DTOAgendamento {
  late DateTime dataHora;
  late Duration duracao;
  late String servico;
  late String status;

  DTOAgendamento({
    required this.dataHora,
    required this.duracao,
    required this.servico,
    required this.status,
  });

  set id(int id){}
}


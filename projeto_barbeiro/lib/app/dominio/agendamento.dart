class Agendamento {
  final int clienteId;
  final int profissionalId;
  final DateTime dataHora;
  final Duration duracao;
  final String servico;
  String status;
  IDAOAgendamento dao;

  Agendamento({required this.dao});

  validar({required DTOAgendamento dto}){
    clienteId = dto.clienteId;
    profissionalId = dto.profissionalId;
    dataHora = dto.dataHora;
    duracao = dto.duracao;
    servico = dto.servico;
    status = dto.status;
  }

  Future<DTOAgendamento> salvar(DTOAgendamento dto){
    validar(dto: dto);
    return dao.salvar(dto);
  }

  Future<DTOAgendamento> alterar(dynamic id) async{
    this.id = id;
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async{
    this.id = id;
    return true;
  }

  Future<List<DTOAgendamento>> consulta() async{
    return await dao.consulta();
  }

  dynamic? get clienteId => _clienteId;
  dynamic? get profissionalId => _profissionalId;
  DateTime? get dataHora => _dataHora;
  Duration? get duracao => _duracao;
  String? get servico => _servico;
  String? get status => _status;

  set clienteId(int? id){
    _clienteId = clienteId;
  }

  set profissionalId(int? id){
    _profissionalId = profissionalId;
  }

  set dataHora(DateTime dataHora){
    _dataHora = dataHora;
  }

  set duracao(Duration duracao){
    _duracao = duracao;
  }

  set servico(String servico){
    _servico = servico;
  }

  set status(String status){
    _status = status;
  }

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
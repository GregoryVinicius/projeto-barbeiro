class APServico{
  late DAOAgendamento dao;
  late Servico dominio;

  APServico(){
    dao = DAOAgendamento();
    dominio = Servico();
  }

  Future<DTOAgendamento> salvar(DTOAgendamento dto) async{
    return await dominio.salvar(dto);
  }

  Future<DTOAgendamento> alterar(dynamic id) async{
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async{
    await dominio.alterar(id);
    return true
  }

  Future<List<DTOAgendamento>> consulta() async{
    return await dominio.consulta();
  }
}
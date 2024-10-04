class Servico {
  late DateTime tempoEstimado;
  // var cabelo = 1;
  // var barba = 2;
  // var cabeloBarba = 3;

  Servico(Servico) {
    TipoServico(Servico);
  }

  DateTime TipoServico(int servico) {
    if (servico == 1) {
      this.tempoEstimado = DateTime(0, 0, 0, 0, 20);
    } else if (servico == 2) {
      this.tempoEstimado = DateTime(0, 0, 0, 0, 10);
    } else if (servico == 3) {
      this.tempoEstimado = DateTime(0, 0, 0, 0, 30);
    }
    return tempoEstimado;
  }
}

const criarTabelas = [
  '''
  CREATE TABLE cliente(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,idade integer NOT NULL
    ,numeroTelefone VARCHAR(16) NOT NULL
    ,email VARCHAR(200)
    ,cpf CHAR(14) NOT NULL UNIQUE
    ,senha VARCHAR(200) NOT NULL
  );

  CREATE TABLE agendamento (
    id INTEGER NOT NULL PRIMARY KEY
    ,cliente_id INTEGER NOT NULL
    ,profissional_id INTEGER NOT NULL
    ,data_hora DATETIME NOT NULL
    ,servico VARCHAR(100) NOT NULL
    ,duracao INTEGER NOT NULL
    ,status VARCHAR(20) NOT NULL
);
  '''
];

const inserirRegistros = [
  'INSERT INTO cliente (id, nome, idade, numeroTelefone, email, cpf, senha) VALUES (1, "Ana Souza", 29, "11987654321", "ana.souza@example.com", "123.456.789-00", "senhaAna123")',
  'INSERT INTO cliente (id, nome, idade, numeroTelefone, email, cpf, senha) VALUES (2, "Carlos Oliveira", 35, "21987654321", "carlos.oliveira@example.com", "987.654.321-00", "senhaCarlos456")',
  'INSERT INTO cliente (id, nome, idade, numeroTelefone, email, cpf, senha) VALUES (3, "Maria Silva", 42, "31987654321", "maria.silva@example.com", "456.789.123-00", "senhaMaria789")',
  'INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) VALUES (1, 1, "2024-11-01 09:00:00", "Corte de cabelo", 30, "agendado")',
  'INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) VALUES (2, 1, "2024-11-01 10:00:00", "Barba", 20, "agendado")',
  'INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) VALUES (3, 2, "2024-11-01 11:00:00", "Corte de cabelo e barba", 60, "agendado")',
  'INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) VALUES (1, 2, "2024-11-01 15:00:00", "Corte de cabelo", 30, "agendado")',
  'INSERT INTO agendamento (cliente_id, profissional_id, data_hora, servico, duracao, status) VALUES (2, 1, "2024-11-02 09:30:00", "Corte de cabelo", 30, "agendado");'
];

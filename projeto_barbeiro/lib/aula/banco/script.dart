const criarTabelas = [
  '''
  CREATE TABLE professor(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,descricao VARCHAR(200)
    ,cpf CHAR(14) NOT NULL UNIQUE
    ,status CHAR(1) NOT NULL
  )
  '''
];

const inserirRegistros = [
  'INSERT INTO professor (nome, cpf, status) VALUES ("JOAQUIN", "123.456.789-10", "A"),'
  'INSERT INTO professor (nome, cpf, status) VALUES ("JOÃO", "123.456.789-11", "A"),'
  'INSERT INTO professor (nome, cpf, status) VALUES ("JOELITON", "123.456.789-12, "A"),'
];

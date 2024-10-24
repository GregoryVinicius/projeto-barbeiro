import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/aplicacao/ap_cliente.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';

class FormCliente extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _nomeController = TextEditingController();
    final _idadeController = TextEditingController();
    final _emailController = TextEditingController();
    final _cpfController = TextEditingController();
    final _senhaController = TextEditingController();
    final _numeroTelefoneController = TextEditingController();

    Widget CriarBotao(BuildContext context, String rota, String rotulo) {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, rota),
        child: Text(rotulo));
    }

    void _criarProcedimento() async{
      final nome = _nomeController.text;
      final idade = _idadeController;
      final email = _emailController.text;
      final cpf = _cpfController.text;
      final senha = _senhaController.text;
      final numeroTelefone = _numeroTelefoneController.text;

      DTOCliente dto = DTOCliente(idade: idade as int, nome: nome, email: email, cpf: cpf, senha: senha, numeroTelefone: numeroTelefone);
      APCliente apCliente = APCliente();
      await apCliente.salvar(dto);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cliente salvo com sucesso')),
      );
    }
     return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idadeController,
                decoration: InputDecoration(labelText: 'Idade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o idade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o CPF';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroTelefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o telefone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a senha';
                  }
                  return null;
                },
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _criarProcedimento,
                child: Text('Salvar'),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
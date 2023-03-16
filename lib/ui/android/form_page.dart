import 'package:flutter/material.dart';
import 'package:form/blocs/form_page.bloc.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  FormPageBloc bloc = FormPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            title: const Text('Cadastro'),
            elevation: 0,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white54),
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: bloc.validateNome,
                  onSaved: (value) => {bloc.nome = value!},
                  decoration: const InputDecoration(
                      hintText: "Nome",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      fillColor: Color.fromARGB(22, 68, 137, 255),
                      filled: true,
                      prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: bloc.validateEmail,
                  onSaved: (value) => {bloc.email = value!},
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    fillColor: Color.fromARGB(22, 68, 137, 255),
                    filled: true,
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: bloc.validatePassword,
                  obscureText: true,
                  onSaved: (value) => {bloc.senha = value!},
                  decoration: const InputDecoration(
                      hintText: "Senha",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      fillColor: Color.fromARGB(22, 68, 137, 255),
                      filled: true,
                      prefixIcon: Icon(Icons.key)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save(),
                        openDialog(),
                        setState(() {
                          bloc.email;
                          bloc.senha;
                          bloc.nome;
                        })
                      },
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF448AFF),
                      padding: const EdgeInsets.all(20)),
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Cadastro realizado com sucesso!"),
            content: Column(
              children: [
                Text(
                    "Olá ${bloc.nome}, enviamos um e-mail para ${bloc.email}, realize a verificação de conta"),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => {
                        setState(() {
                          bloc.email;
                          bloc.senha;
                          bloc.nome;
                        }),
                        Navigator.of(context).pop()
                      },
                  child: const Text("OK"))
            ],
          ));
}

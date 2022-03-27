import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  final _formKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: usernameCtrl,
                decoration: InputDecoration(
                  labelText: 'username',
                ),
                validator: (username) => !GetUtils.isUsername(username!)
                    ? 'Username inválido'
                    : null,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'e-mail',
                ),
                validator: (email) =>
                    !GetUtils.isEmail(email!) ? 'E-mail inválido' : null,
              ),
              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  labelText: 'password',
                ),
                obscureText: true,
                validator: (password) =>
                    password!.isEmpty ? 'Informe uma senha' : null,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.register(
                            usernameCtrl.text,
                            emailCtrl.text,
                            passwordCtrl.text,
                          );
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text('Cadastrar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

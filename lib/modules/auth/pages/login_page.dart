import 'package:flutter/material.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  final _formKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                validator: (username) => username == null || username.isEmpty
                    ? 'Username inválido'
                    : null,
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
                          controller.login(
                            usernameCtrl.text,
                            passwordCtrl.text,
                          );

                          Navigator.of(context).pushNamed('timeline');
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text('Entre'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text('ou'),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // if (!Get.isSnackbarOpen!) {
                        //   Get.snackbar('Ops!', 'Tela em construção');
                        // }
                      },
                      child: Text('Cadastre-se'),
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

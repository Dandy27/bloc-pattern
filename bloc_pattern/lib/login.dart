



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LOGIN_PAGE';

  final String errorMessage;

  LoginPage({required this.errorMessage});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController =
      TextEditingController(text: 'dandy@gmail.com');
  final _passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    void _authenticate() {
      final sigInEvent = SignInEvent(
          email: _emailController.text, password: _passwordController.text);
      bloc.add(sigInEvent);
    }

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
              ),
              SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 30),
              widget.errorMessage == ''
                  ? SizedBox()
                  : Text(widget.errorMessage),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _authenticate,
                      child: Text('Acessar HomePage'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

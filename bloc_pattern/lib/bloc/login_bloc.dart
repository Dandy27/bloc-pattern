import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/bloc/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInEvent)
      try {
        yield StartLoginState();
        final user = await authenticate(event.email, event.password);
        // ignore: unrelated_type_equality_checks
        if (user == '') {
          yield ErrorLoginState(message: 'Email ou senha inválido');
        } else {
          yield SuccessLoginState(user: user);
        }
      } catch (e) {
        yield ErrorLoginState(message: 'Ops algo deu errado ');
        print(e);
      }

    if (event is SignInEvent) {}
  }

  Future<User> authenticate(String email, String password) {
    return Future.delayed(Duration(seconds: 3), () {
      if (email == 'dandy@gmail.com' && password == '123456')
        return User(name: 'Dandy', email: 'dandy@gmail.com');
      throw Container();
    });
  }
}

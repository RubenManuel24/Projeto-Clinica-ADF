import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:fe_lab_clinicas_self_service/src/service/user_login_service.dart';

class LoginController  with MessageStateMixin{

  LoginController({
    required UserLoginService loginService,
  }) : _loginService = loginService;

  final UserLoginService _loginService;

  final _obscurePassword = signal(true);
  final _logged = signal(false);


  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult = await _loginService.execute(email, password).asyncLoader();

    switch(loginResult){
      case Left(value: ServiceException(:final message)):
       print("Não Passou ------------ ${loginResult}");
       showError(message);
      case Right(value: _):
       _logged.value = true;
       print("Passou ------------ ${_logged}");

    }
  }
  
}

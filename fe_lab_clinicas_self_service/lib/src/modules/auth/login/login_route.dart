import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_page.dart';
import 'package:fe_lab_clinicas_self_service/src/service/user_login_service.dart';
import 'package:fe_lab_clinicas_self_service/src/service/user_login_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRoute extends FlutterGetItModulePageRouter{

  @override
  List<Bind<Object>> get bindings =>[
    Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceImpl(userRepository: i())),
    Bind.lazySingleton((i) => LoginController())
  ];

  @override
  WidgetBuilder get view =>  (_) => const LoginPage();
}
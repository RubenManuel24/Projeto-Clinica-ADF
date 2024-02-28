import 'package:fe_lab_clinicas_adm/src/repositories/user/user_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/user/user_repositoryImpl.dart';

import '../../services/login/user_login_service_impl.dart';
import '../../services/login/user_login_service.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginRoute extends FlutterGetItPageRouter {
  const LoginRoute({super.key});


  @override
  String get routeName => '/login';

  @override
  List<Bind<Object>> get bindings =>[
    Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceImpl(userRepository: i())),
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
    Bind.lazySingleton((i) => LoginController(loginService: i()))
  ];

  @override
  WidgetBuilder get view =>  (_) => const LoginPage();

}
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_route.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repositoryImpl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModules extends FlutterGetItModule{

  @override
  List<Bind<Object>> get bindings =>[
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
  ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/login': (_) => LoginRoute()
  };
}
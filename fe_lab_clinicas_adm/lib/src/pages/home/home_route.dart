

import 'package:fe_lab_clinicas_adm/src/pages/home/home_controller.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendament_desk_assignment/attendament_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendament_desk_assignment/attendament_desk_assignment__repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'home_page.dart';

class HomeRoute extends FlutterGetItPageRouter{

  @override
  String get routeName => '/home';

   @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<AttendamentDeskAssignmentRepository>((i) => AttendamentDeskAssignmentRepositoryImpl(restClient: i())),
    Bind.lazySingleton((i) => HomeController(attendamentDeskAssignmentRepository: i()))
  ];

  @override
  WidgetBuilder get view => (_) => const HomePage();
}
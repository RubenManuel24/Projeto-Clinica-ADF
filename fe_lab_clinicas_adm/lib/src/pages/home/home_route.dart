

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'home_page.dart';

class HomeRoute extends FlutterGetItPageRouter{

  @override
  String get routeName => '/home';

   @override
  List<Bind<Object>> get bindings => [];

  @override
  WidgetBuilder get view => (_) => const HomePage();

  
}
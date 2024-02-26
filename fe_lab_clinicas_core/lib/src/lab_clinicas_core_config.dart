import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'theme/lab_clinicas_theme.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    Key? key,
    this.bindings,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
    this.didStart,
  }) : super(key: key);

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;


  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: true,
        bindings: bindings,
        pages: [...pages ?? [], ...pagesBuilders ?? []],
        modules: modules,
        builder: (context, routes, flutterGetItNavObserver) {
          return AsyncStateBuilder(
            loader: LabClinicasLoader(),
            builder: (navigatorObserver) {
              
              if(didStart != null){
                didStart!();
              }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.lightTheme,
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver],
              routes: routes,
              title: title,
            );
          });
        });
  }
}

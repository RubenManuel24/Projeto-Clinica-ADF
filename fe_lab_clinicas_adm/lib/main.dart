import 'dart:async';
import 'dart:developer';
import 'package:fe_lab_clinicas_adm/src/pages/checkin/checkin_router.dart';
import 'package:fe_lab_clinicas_adm/src/pages/pre_checkin/pre_checkin_router.dart';
import 'package:fe_lab_clinicas_adm/src/pages/splash/splash_pages.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'src/bindings/lab_clinicas_application_binding.dart';
import 'src/pages/end_checkin/end_checkin_router.dart';
import 'src/pages/home/home_route.dart';
import 'src/pages/login/login_route.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const LabClinicasADM());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasADM extends StatelessWidget {
  const LabClinicasADM({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      bindings: LabClinicasApplicationBinding(),
      title: 'Lab Clinicas ADM',
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPages(), path: '/')
      ],
      pages: [const LoginRoute(),  HomeRoute(), PreCheckinRouter(), const CheckinRouter(), const EndCheckinRouter()],
      );
  }
}

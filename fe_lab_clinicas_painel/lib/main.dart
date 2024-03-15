import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/src/binding/lab_clinicas_aplixation_binding.dart';
import 'package:fe_lab_clinicas_painel/src/pages/login/login_route.dart';
import 'package:fe_lab_clinicas_painel/src/pages/painel/painel_router.dart';
import 'package:fe_lab_clinicas_painel/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const LabClinicasPainelApp());
}

class LabClinicasPainelApp extends StatelessWidget {

  const LabClinicasPainelApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return LabClinicasCoreConfig(
        title: 'Lab Clinicas Painel',
        bindings: LabClinicasAplixationBinding(),
        pagesBuilders: [
          FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/')
        ],
        pages:  const [LoginRoute(), PainelRouter()],
      );
  }
}
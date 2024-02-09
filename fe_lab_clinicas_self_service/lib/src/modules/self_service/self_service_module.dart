import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan/documents_sacan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_pge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'who_i_am/who_i_am_page.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton((i) => SelfServiceController())
  ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (BuildContext context) => const SelfServicePge(),
        '/whoIAm': (BuildContext context) => const WhoIAmPage(),
        '/find-patient': (BuildContext context) => const FindPatientPage(),
        '/patient': (BuildContext context) => const PatientPage(),
        '/documents': (BuildContext context) => const DocumentsPage(),
        '/documents/scan': (BuildContext context) => const DocumentsSacanPage(),
        '/documents/scan/confirm': (BuildContext context) =>
            const DocumentsScanConfirmPage(),
        '/done': (BuildContext context) => const DonePage(),
      };
}

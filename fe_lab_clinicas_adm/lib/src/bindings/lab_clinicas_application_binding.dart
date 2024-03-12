import 'package:fe_lab_clinicas_adm/src/repositories/attendament_desk_assignment/attendament_desk_assignment__repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendament_desk_assignment/attendament_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/painel_repository/painel_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/painel_repository/painel_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/services/call_next_patient.dart/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../core/env.dart';
import '../repositories/patient_information_form_repository/patient_information_form_repository.dart';
import '../repositories/patient_information_form_repository/patient_information_form_repository_impl.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() =>  [
        Bind.lazySingleton((i) => RestClient(Env.backendBaseUrl)),
        Bind.lazySingleton<PatientInformationFormRepository>((i) => PatientInformationFormRepositoryImpl(restClient: i())),
        Bind.lazySingleton<AttendamentDeskAssignmentRepository>((i) => AttendamentDeskAssignmentRepositoryImpl(restClient: i())),
        Bind.lazySingleton<PainelRepository>((i) => PainelRepositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => CallNextPatientService(
          patientInformationFormRepository: i(),
          attendamentDeskAssignmentRepository: i(),
          painelRepository: i()))

    ];
}

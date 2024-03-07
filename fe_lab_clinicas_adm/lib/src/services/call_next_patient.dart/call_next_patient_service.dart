import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import 'package:fe_lab_clinicas_adm/src/repositories/painel_repository/painel_repository.dart';

import '../../model/patient_information_form_model.dart';
import '../../repositories/attendament_desk_assignment/attendament_desk_assignment_repository.dart';
import '../../repositories/patient_information_form_repository/patient_information_form_repository.dart';

class CallNextPatientService {
  CallNextPatientService({
    required this.patientInformationFormRepository,
    required this.attendamentDeskAssignmentRepository,
    required this.painelRepository,
  });

  final PatientInformationFormRepository patientInformationFormRepository;
  final AttendamentDeskAssignmentRepository attendamentDeskAssignmentRepository;
  final PainelRepository painelRepository;

  Future<Either<RepositoryException, PatientInformationFormModel?>>
      execute() async {
    final result = await patientInformationFormRepository.callNextCheckin();

    switch (result) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final form?):
        return updatePanel(form);
      case Right():
        return Right(null);
    }
  }

  Future<Either<RepositoryException, PatientInformationFormModel?>> updatePanel(
      PatientInformationFormModel form) async {
    final resultDesk =
        await attendamentDeskAssignmentRepository.getDeskAssigment();
    switch (resultDesk) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final painelResult =
            await painelRepository.callOnPanel(form.password, deskNumber);

        switch (painelResult) {
          case Left(value: final exception):
            log('ATENÇÃO!!! Não foi possível chamar o paciente',
                error: exception,
                stackTrace: StackTrace.fromString(
                    'ATENÇÃO!!! Não foi possível chamar o paciente'));
          return Right(form);
          case Right():
          return Right(form);
        }
    }
  }
}

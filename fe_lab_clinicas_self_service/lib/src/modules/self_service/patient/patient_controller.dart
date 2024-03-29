
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';

import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  PatientController({
    required PatientRepository repository,
  }) : _repository = repository;

   final PatientRepository _repository;
   PatientModel? pateint;
   final _nextStep = signal<bool>(false);
   bool get nextStep => _nextStep();

   void goNextStep(){
     _nextStep.value = true;
   }

   Future<void> updateAndNext(PatientModel model) async {
     final updateResult = await _repository.update(model);

     switch(updateResult){
      case Left():
        showError('Erro ao atualizar dados do paciente, chame o atendente!');
      case Right():
         showInfo('Paciente atualizado com sucesso!');
         pateint = model;
         goNextStep();

     }
   }

   Future<void> saveAndNext(RegisterPatientModel registerPatientModel) async {
     final result = await _repository.register(registerPatientModel);
     switch(result){
      case Left():
        showError('Erro ao atualizar dados do paciente, chane o atendente');
      case Right(value: final pateint):
       showInfo('Paciente atualizado com sucesso');
       this.pateint = pateint;
       goNextStep();
     }
   }
  
}

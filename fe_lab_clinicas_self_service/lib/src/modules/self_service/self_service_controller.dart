import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  document,
  done,
  restart
  }

class SelfServiceController with MessageStateMixin {
  final _stap = ValueSignal(FormSteps.whoIAm);
  var _model = const SelfServiceModel();

  SelfServiceModel get model => _model;

  FormSteps get stap => _stap();

  void startProcess(){
    _stap.forceUpdate(FormSteps.whoIAm);
  }
  
  void setWhoIAmDataStepAndNext(String name, String lastName){
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _stap.forceUpdate(FormSteps.findPatient);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient){
    _model = _model.copyWith(patient: () => patient);
    _stap.forceUpdate(FormSteps.patient);
  }

  void restartProcess() {
    _stap.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _stap.forceUpdate(FormSteps.document);
  }

}

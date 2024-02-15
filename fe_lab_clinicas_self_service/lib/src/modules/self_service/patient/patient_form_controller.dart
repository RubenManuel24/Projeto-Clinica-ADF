import 'package:flutter/material.dart';

import '../../../model/patient_model.dart';
import 'patient_page.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIndentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    streetEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianIndentificationNumberEC.dispose();

    super.dispose();
  }

  void initializeForm(final PatientModel? patient) {
    if (patient != null) {
      nameEC.text = patient.name;
      emailEC.text = patient.email;
      phoneEC.text = patient.phoneNumber;
      documentEC.text = patient.document;
      cepEC.text = patient.address.cep;
      streetEC.text = patient.address.streetAddress;
      numberEC.text = patient.address.number;
      complementEC.text = patient.address.addressComplement;
      stateEC.text = patient.address.state;
      cityEC.text = patient.address.city;
      districtEC.text = patient.address.district;
      guardianEC.text = patient.guardian;
      guardianIndentificationNumberEC.text =
          patient.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient(PatientModel patient) {
    return patient.copyWith(
        name: nameEC.text,
        email: emailEC.text,
        phoneNumber: phoneEC.text,
        document: documentEC.text,
        address: patient.address.copyWith(
            cep: cepEC.text,
            streetAddress: streetEC.text,
            number: numberEC.text,
            state: stateEC.text,
            addressComplement: complementEC.text,
            city: cityEC.text,
            district: districtEC.text),
        guardian: guardianEC.text,
        guardianIdentificationNumber: patient.guardianIdentificationNumber);
  }
}

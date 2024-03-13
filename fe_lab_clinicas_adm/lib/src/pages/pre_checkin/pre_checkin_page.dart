import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/data_item.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width * .5,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 56),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: LabClinicasTheme.orangeColor),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/patient_avatar.png'),
                    const SizedBox(height: 16),
                    Text(
                      'A senha chamada foi',
                      style: LabClinicasTheme.titleSmalltyle,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      alignment: Alignment.center,
                      width: 218,
                      decoration: BoxDecoration(
                          color: LabClinicasTheme.orangeColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text(
                        "Ruben Manuel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const DataItem(
                      label: 'Nome Paciente',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'Email',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'Telefone de contacto',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'CPF',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'CEF',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'Endereço',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'Responsável',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const DataItem(
                      label: 'Documento de identificação',
                      value: 'Ruben Manuel',
                      padding: EdgeInsets.only(bottom: 24),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(fixedSize: const Size.fromHeight(48)),
                                onPressed: () {},
                                child: const Text('CHAMAR OUTRA SENHA'))),
                        const SizedBox(width: 16),
                        Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(fixedSize: const Size.fromHeight(48)),
                                onPressed: () {}, child: const Text('ATENDER')))
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}

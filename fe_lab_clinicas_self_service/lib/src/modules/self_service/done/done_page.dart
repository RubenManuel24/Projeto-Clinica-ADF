import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DonePage extends StatelessWidget {
  DonePage({super.key});

  final selfServiceController = Injector.get<SelfServiceController>();

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
              width: sizeOf.width * .85,
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: LabClinicasTheme.orangeColor)),
              child: Column(
                children: [
                  Image.asset('assets/images/stroke_check.png'),
                  const SizedBox(height: 15),
                  Text(
                    'Sua senha é',
                    style: LabClinicasTheme.titleSmalltyle,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(
                      minWidth: 218,
                      minHeight: 48,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: LabClinicasTheme.orangeColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child:  Text(
                      selfServiceController.password.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text.rich(
                    TextSpan(
                      style: TextStyle(
                          color: LabClinicasTheme.blueColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'AGUARDE! \n'),
                        TextSpan(text: 'Sua senha será chamado no painel! \n'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('IMPRIMIR SENHA'))),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {},
                              child: const Text('ENVIAR SENHA VIA SMS')))
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(backgroundColor: LabClinicasTheme.orangeColor),
                        onPressed: () {
                          selfServiceController.startProcess();
                        },
                        child: const Text(
                          'FINALIZAR',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

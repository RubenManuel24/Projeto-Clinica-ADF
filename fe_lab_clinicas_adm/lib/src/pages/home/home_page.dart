import 'package:fe_lab_clinicas_adm/src/pages/home/home_controller.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with MessageViewMixin{

  final formKey = GlobalKey<FormState>();
  final deskNumber = TextEditingController();
  final controller = Injector.get<HomeController>();

  @override
  void initState() {
    messageListener(controller);
    effect((){
      if(controller.informationForm != null){
        Navigator.of(context).pushReplacementNamed('/pre-checkin', arguments: controller.informationForm);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    deskNumber.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Center(
          child: Form(
            key: formKey,
            child: Container(
                    padding: const EdgeInsets.all(40),
                    width: mediaQuery.width * .50,
                    decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor)),
                    child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bem-vindo!', style: LabClinicasTheme.titleStyle),
              const SizedBox(height: 32),
              Text('Preencha o número do guiché que você está atendendo',
                  style: LabClinicasTheme.subTitleSmallStyle),
                const SizedBox(height: 24),
                SizedBox(
                 width: double.infinity,
                  child: TextFormField(
                    controller: deskNumber,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Guichê obrigatorio'),
                        Validatorless.number('Guichê deve ser um número')
                      ]
                    ),
                    decoration: const InputDecoration(label: Text('Número do Guichê')),
                  )),
                 const SizedBox(height: 32),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    final valid = formKey.currentState?.validate() ?? false;
                    if(valid){
                      controller.startService(int.parse(deskNumber.text));
                    }
                  }, child: const Text('CHAMAR PRÓXIMO PACIENTE')))
            ],
                    ),
                  ),
          )),
    );
  }
}

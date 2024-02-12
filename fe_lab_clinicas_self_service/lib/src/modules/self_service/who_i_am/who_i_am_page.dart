import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});



  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formKey = GlobalKey<FormState>();
  final firstNameC = TextEditingController(text: "Ruebn");
  final lastNameC = TextEditingController(text: "Manuel");

  @override
  void dispose() {
    super.dispose();
    firstNameC.dispose();
    lastNameC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didpop){
        firstNameC.text = '';
        lastNameC.text = '';
        selfServiceController.clearForm();
      },
      child: Scaffold(
        appBar: LabClinicasAppBar(
          actions: [
            PopupMenuButton(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text("Finalizar Terminal"),
                  ),
                ];
              },
             onSelected: (value) async {
              final nav = Navigator.of(context);
               if(value == 1) {
                  await SharedPreferences.getInstance().then((sp) => sp.clear());
                  nav.pushNamedAndRemoveUntil('/', (route) => false);
               }
             },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (_, constrains) {
            final sizeOf = MediaQuery.of(context).size;
            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(maxHeight: constrains.maxHeight),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_login.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    width: sizeOf.width * .8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/logo_vertical.png"),
                            const SizedBox(height: 48),
                            Text(
                              "Bem-Vindo!",
                              style: LabClinicasTheme.titleStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 48),
                            TextFormField(
                              controller: firstNameC,
                              validator: Validatorless.required("Nome obrigatório"),
                              decoration: const InputDecoration(
                                labelText: "Digite o seu nome",
                              ),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              controller: lastNameC,
                              validator: Validatorless.required("Sobrenome obrigatório"),
                              decoration: const InputDecoration(
                                labelText: "Digite o seu sobrenome",
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: sizeOf.width * .8,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  final valid = formKey.currentState?.validate() ?? false;
                                  if (valid) {
                                    selfServiceController.setWhoIAmDataStepAndNext(
                                      firstNameC.text, 
                                      lastNameC.text
                                    );
                                  } 
                                },
                                child: const Text("CONTINUAR"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

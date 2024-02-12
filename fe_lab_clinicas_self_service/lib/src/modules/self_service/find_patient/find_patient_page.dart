import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage> {
   final formKey = GlobalKey<FormState>();
   final documentEC = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text("Reiniciar Processo"),
                ),
              ];
            },
           onSelected: (value) async {
            
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
                          TextFormField(
                            controller: documentEC,
                            validator: Validatorless.required("CPF obrigatório"),
                            decoration: const InputDecoration(
                              labelText: "Digite o CPF do paciente",
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(children: [
                            const Text("Não sabe o CPF do paciente", style: TextStyle(
                              color: LabClinicasTheme.blueColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),),
                            TextButton(
                              onPressed: (){}, 
                              child: const Text("Clique aqui", style: TextStyle(
                              color: LabClinicasTheme.orangeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),)),
                            const SizedBox(height: 24),
                          ],),
                          SizedBox(
                            width: sizeOf.width * .8,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid = formKey.currentState?.validate() ?? false;
                                if (valid) {
                                 
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
    );
  }
}

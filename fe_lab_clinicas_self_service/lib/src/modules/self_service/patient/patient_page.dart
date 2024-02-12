import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatelessWidget {

  const PatientPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Patient'),),
           body:Column(
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
                          
                          validator: Validatorless.required("Nome obrigatório"),
                          decoration: const InputDecoration(
                            labelText: "Digite o seu nome",
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          
                          validator: Validatorless.required("Sobrenome obrigatório"),
                          decoration: const InputDecoration(
                            labelText: "Digite o seu sobrenome",
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                        
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              
                              
                            },
                            child: const Text("CONTINUAR"),
                          ),
                        ),
                      ],
                    ),
       );
  }
}
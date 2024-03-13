import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class CheckinImageLink extends StatelessWidget {
  final String label;

  const CheckinImageLink({
    Key? key,
    required this.label,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: const EdgeInsets.all(10),
         child: Text(label, style: const TextStyle(
          color: LabClinicasTheme.blueColor,
          fontSize: 14,
          fontWeight: FontWeight.w400
         ),),
       );
  }
}

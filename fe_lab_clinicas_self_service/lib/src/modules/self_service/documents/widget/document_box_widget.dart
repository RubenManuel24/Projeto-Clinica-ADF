import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentBoxWidget extends StatelessWidget {
  final Widget icon;
  final uploaded;
  final String label;
  final int totalFiles;
  final VoidCallback? onTap;


   const DocumentBoxWidget({
    Key? key,
    required this.icon,
    required this.uploaded,
    required this.label,
    required this.totalFiles,
     this.onTap
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    final totalFilesLabel = totalFiles > 0 ? '($totalFiles)' : '';
       return Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: uploaded ? LabClinicasTheme.lightOrangeColor :  Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor)
            ),
            child:  Column(
              children: [
                Expanded(child: icon),
                Text('$label $totalFilesLabel',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: LabClinicasTheme.orangeColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
                )
          
              ],
          )
            ),
        ),
      );
  }
}

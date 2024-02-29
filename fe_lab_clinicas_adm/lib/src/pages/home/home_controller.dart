import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendament_desk_assignment/attendament_desk_assignment_repository.dart';

class HomeController with MessageStateMixin {

  HomeController({
    required AttendamentDeskAssignmentRepository attendamentDeskAssignmentRepository
  }) : _attendamentDeskAssignmentRepository = attendamentDeskAssignmentRepository;

  final AttendamentDeskAssignmentRepository _attendamentDeskAssignmentRepository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result = await _attendamentDeskAssignmentRepository.startService(deskNumber);

    switch(result){
      case Left():
        asyncstate.AsyncState.hide();
        showError('Erro ao iniciar Guichê');
      case Right():
         asyncstate.AsyncState.hide();
        showInfo('Registrou com sucesso');
    }
  }
}

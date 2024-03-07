import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class AttendamentDeskAssignmentRepository {
  Future<Either<RepositoryException, Unit>> startService(int deskNumber);
  Future<Either<RepositoryException, int>> getDeskAssigment();
}
import 'package:teslo_shop/features/estudiantes/domain/entities/estudiante.dart';

abstract class EstudianteDatasource {
  Future<List<Estudiante>> getStudentsByTutor(String token);
}

import 'package:teslo_shop/features/estudiantes/domain/entities/estudiante.dart';

abstract class EstudianteRepository {
  Future<List<Estudiante>> getStudentsByTutor(String token);
}

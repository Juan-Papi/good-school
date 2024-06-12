import 'package:teslo_shop/features/estudiantes/domain/domain.dart';
import 'package:teslo_shop/features/estudiantes/infrastructure/datasources/estudiante_datasource_impl.dart';

class EstudianteRepositoryImpl extends EstudianteRepository {
  final EstudianteDatasource datasource;

  EstudianteRepositoryImpl({EstudianteDatasource? datasource})
      : datasource = datasource ?? EstudianteDatasourceImpl();

  @override
  Future<List<Estudiante>> getStudentsByTutor(String token) {
    return datasource.getStudentsByTutor(token);
  }
}

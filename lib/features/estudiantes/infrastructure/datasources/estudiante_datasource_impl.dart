import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';
import 'package:teslo_shop/features/auth/infrastructure/errors/auth_errors.dart';
import 'package:teslo_shop/features/estudiantes/domain/domain.dart';
import 'package:teslo_shop/features/estudiantes/infrastructure/mappers/estudiante_mapper.dart';

class EstudianteDatasourceImpl extends EstudianteDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<List<Estudiante>> getStudentsByTutor(String token) async {
    try {
      final response = await dio.get('/students/by_tutor',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.data['data'] == null) {
        throw Exception('No data available');
      }

      final List<dynamic> listaEstudiantesJson = response.data['data'];
      if (listaEstudiantesJson.isEmpty) {
        return [];
      }

      final List<Estudiante> listaEstudiantes =
          listaEstudiantesJson.map((estudianteJson) {
        return EstudianteMapper.estudianteJsonToEntity(estudianteJson);
      }).toList();

      return listaEstudiantes;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto');
      }
      throw Exception('Error en la solicitud: ${e.message}');
    } catch (e) {
      throw Exception('Error al procesar los datos: ${e.toString()}');
    }
  }
}

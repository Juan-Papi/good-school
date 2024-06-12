import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/estudiantes/domain/entities/estudiante.dart';
import 'package:teslo_shop/features/estudiantes/domain/repositories/estudiante_repository.dart';
import 'package:teslo_shop/features/estudiantes/infrastructure/repositories/estudiante_repository.dart';
import 'package:teslo_shop/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:teslo_shop/features/shared/infrastructure/services/key_value_storage_service_impl.dart';

//! 3
final estudianteProvider =
    StateNotifierProvider.autoDispose<EstudianteNotifier, EstudianteState>((ref) {
  final estudianteRepository = EstudianteRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  final authState = ref.watch(authProvider);

  return EstudianteNotifier(
      estudianteRepository: estudianteRepository,
      keyValueStorageService: keyValueStorageService,
      authState:
          authState); // Pasar el estado de autenticación al EstudianteNotifier
});

//! 2
class EstudianteNotifier extends StateNotifier<EstudianteState> {
  final EstudianteRepository estudianteRepository;
  final KeyValueStorageService keyValueStorageService;
  final AuthState authState; // Agregar esto

  EstudianteNotifier({
    required this.estudianteRepository,
    required this.keyValueStorageService,
    required this.authState, // Requerir el estado de autenticación
  }) : super(EstudianteState());

  Future<List<Estudiante>> getStudentsByTutor() async {
    if (authState.authStatus != AuthStatus.authenticated ||
        authState.user == null) {
      // No autenticado o no hay información de usuario
      return [];
    }

    // Si está autenticado, usar el token del usuario autenticado
    return await estudianteRepository.getStudentsByTutor(authState.user!.token);
  }

  Future<void> refreshStudents() async {
    final students = await getStudentsByTutor();
    state = state.copyWith(estudiantes: students);
  }
}

//! 1
class EstudianteState {
  final List<Estudiante>? estudiantes;

  EstudianteState({
    this.estudiantes,
  });

  EstudianteState copyWith({
    List<Estudiante>? estudiantes,
  }) =>
      EstudianteState(
        estudiantes: estudiantes ?? this.estudiantes,
      );
}

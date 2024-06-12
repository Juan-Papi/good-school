import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teslo_shop/features/estudiantes/presentation/providers/estudiante_provider.dart';

class TipoNotaView extends ConsumerWidget {
  final String estudianteId;
  const TipoNotaView({Key? key, required this.estudianteId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    // Asegurar que el estudiante se carga al iniciar el widget
    ref.read(estudianteProvider.notifier).getEstudiante(estudianteId);

    // Escuchar los cambios en el estudiante
    final estudianteState = ref.watch(estudianteProvider);

    if (estudianteState.estudiante != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: SizedBox(
                height: 200,
                width: 335,
                child: GestureDetector(
                  onTap: () {
                    context.push('/tipo-nota/libreta/${estudianteState.estudiante!.id}');
                  },
                  child: Card(
                    color: colors.primary,
                    elevation: 0.0,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ver libreta',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)), //
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ListTile(
            //   title: Text(estudianteState.estudiante!.nombre),
            //   subtitle: Text('ID: ${estudianteState.estudiante!.id}'),
            //   onTap: () {
            //     // Usar el ID del estudiante para navegar a la siguiente pantalla
            //     context.push(
            //         '/tipo-nota/libreta/${estudianteState.estudiante!.id}');
            //   },
            // ),
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

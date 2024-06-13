import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/estudiantes/presentation/providers/estudiante_provider.dart';
import 'package:teslo_shop/features/estudiantes/presentation/views/estudiante/libreta_view.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class LibretaScreen extends ConsumerWidget {
  static const name = 'libreta-screen';
  final String estudianteId;

  const LibretaScreen({Key? key, required this.estudianteId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Asegurar que el estudiante se carga al iniciar el widget
    ref.read(estudianteProvider.notifier).getEstudiante(estudianteId);

    // Escuchar los cambios en el estudiante
    final estudianteState = ref.watch(estudianteProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Libreta'),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined))
            ],
          ),
        ),
        body: estudianteState.estudiante != null
            ? LibretaView(
                estudianteId: estudianteState.estudiante!.id.toString(),
              )
            : const Center(child: Text('No hay datos disponibles.')));
  }
}

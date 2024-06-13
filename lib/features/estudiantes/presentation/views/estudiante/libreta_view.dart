import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/estudiantes/domain/entities/subnota.dart';
import 'package:teslo_shop/features/estudiantes/presentation/providers/estudiante_provider.dart';

class LibretaView extends ConsumerWidget {
  final String estudianteId;
  const LibretaView({super.key, required this.estudianteId});

  @override
  Widget build(BuildContext context, ref) {
    // Ensure data is loaded when the widget is initialized
    ref.read(estudianteProvider.notifier).getEstudiante(estudianteId);
    ref.read(estudianteProvider.notifier).getSubnotas(estudianteId);

    // Listen for changes in the student data
    final estudianteState = ref.watch(estudianteProvider);
    if (estudianteState.subnotas != null &&
        estudianteState.subnotas!.isNotEmpty) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStudentInfoSection(estudianteState),
              const SizedBox(height: 35),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  defaultColumnWidth: const IntrinsicColumnWidth(),
                  border: TableBorder.all(),
                  children: _buildTableRows(estudianteState.subnotas!),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  List<TableRow> _buildTableRows(List<Subnota> subnotas) {
    // Create a header row first
    List<TableRow> rows = [
      const TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('AREAS CURRICULARES',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('MODALIDAD',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('CALIFICACION',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('PROMEDIO ANUAL',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      )
    ];

    // Add a row for each Subnota
    for (var subnota in subnotas) {
      rows.add(TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${subnota.materia}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${subnota.modalidad} ${subnota.numero.toInt()}'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${subnota.subnota}'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${subnota.promedio}'), // Placeholder for actual average calculation
            ),
          ),
        ],
      ));
    }

    return rows;
  }

  Widget _buildStudentInfoSection(EstudianteState state) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Estudiante: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Expanded(
              child: Text(
                  '${state.estudiante!.nombre} ${state.estudiante!.apellido}',
                  style: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('Año de escolaridad: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Expanded(
              child: Text(
                  '${state.subnotas!.first.curso} ${state.subnotas!.first.paralelo} - ${state.subnotas!.first.year}',
                  style: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ],
    );
  }
}

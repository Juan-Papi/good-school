import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardType3 extends StatelessWidget {
  final String? nombre;
  final String? edad;
  final String? tipoNota;
  final String estudianteId;

  const CardType3({super.key, this.nombre, this.edad, this.tipoNota,required this.estudianteId});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 200,
      width: 335,
      child: GestureDetector(
        onTap: () {
          context.push('/tipo-nota/$estudianteId');
        },
        child: Card(
          color: colors.primary,
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (nombre != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.school_outlined,
                        color: Colors.white60,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$nombre',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ], // Espacio entre textos

                if (edad != null) ...[
                  Text('$edad años',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white)), // Label que viene del map
                ],

                if (tipoNota != null) ...[
                  Text('$tipoNota',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white)), // Label que viene del map
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

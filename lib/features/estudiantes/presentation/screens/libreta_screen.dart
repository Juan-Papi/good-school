import 'package:flutter/material.dart';
import 'package:teslo_shop/features/estudiantes/presentation/views/estudiante/libreta_view.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class LibretaScreen extends StatelessWidget {
  static const name = 'libreta-screen';
  final String estudianteId;
  const LibretaScreen({super.key, required this.estudianteId});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Libreta'),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined))
            ],
          ),
        ),
        body: LibretaView());
  }
}

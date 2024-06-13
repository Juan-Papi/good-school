import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/estudiantes/presentation/views/estudiante/tipo_nota_view.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class TipoNotaScreen extends ConsumerStatefulWidget {
  static const name = 'tipo-nota-screen';
  final String estudianteId;
  const TipoNotaScreen({super.key, required this.estudianteId});

  @override
  TipoNotaScreenState createState() => TipoNotaScreenState();
}

class TipoNotaScreenState extends ConsumerState<TipoNotaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: Row(
          children: [
            Text('Seleccione tipo'),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined))
          ],
        ),
      ),
      body: TipoNotaView(estudianteId: widget.estudianteId),
    );
  }
}

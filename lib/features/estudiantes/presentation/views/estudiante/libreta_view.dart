import 'package:flutter/material.dart';

class LibretaView extends StatelessWidget {
  const LibretaView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  'Estudiante: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Expanded(
                  child: Text(
                    'Juan Pablo Rodríguez Gutiérrez',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Text(
                  'Año de escolaridad: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Expanded(
                  child: Text('Sexto C', style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(height: 35),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Áreas Curriculares',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1er Bimestre',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('2do Bimestre',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('3er Bimestre',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Promedio',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  _buildRow('Ciencias Sociales', '85', '87', '86', '80'),
                  _buildRow('Educación Física', '90', '92', '91', '90'),
                  _buildRow('Matemáticas', '78', '80', '79', '30'),
                  _buildRow('Ciencias Naturales', '88', '85', '87', '20'),
                  _buildRow('Tecnología', '92', '90', '91', '70'),
                  _buildRow('Comunicación', '75', '77', '76', '70'),
                  _buildRow('Música', '80', '82', '81', '75'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildRow(String subject, String first, String second, String third,
      String average) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subject),
        ),
        Center(child: Text(first)),
        Center(child: Text(second)),
        Center(child: Text(third)),
        Center(child: Text(average)),
      ],
    );
  }
}
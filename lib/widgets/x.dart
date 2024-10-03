import 'package:flutter/material.dart';

import 'content_column.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio'),),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ContentColumn(title: 'Primer Columna', text: 'Primer Parrafo'),
            ContentColumn(title: 'Segunda Columna', text: 'Segundo Parrafo'),
            ContentColumn(title: 'Tercer Columna', text: 'Tercer Parrafo'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Click'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: const Icon(Icons.home)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
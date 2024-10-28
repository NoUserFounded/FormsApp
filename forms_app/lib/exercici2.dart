import 'package:flutter/material.dart';

class Exercici2 extends StatelessWidget { // Ensure the class name matches
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercici #2'),
      ),
      body: Center(
        child: Text(
          'This is Exercici 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
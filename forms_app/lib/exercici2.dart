import 'package:flutter/material.dart';
import './Forms/FormA.dart';

class Exercici2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercici #2'), // Changed title to match the page
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for Form A
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FormA()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60), // Set height to 60
                    ),
                    child: Text('Form A'),
                  ),
                ),
                SizedBox(width: 25), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for Form B
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60), // Set height to 60
                    ),
                    child: Text('Form B'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space between rows
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for Form C
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60), // Set height to 60
                    ),
                    child: Text('Form C'),
                  ),
                ),
                SizedBox(width: 25), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for Form D
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60), // Set height to 60
                    ),
                    child: Text('Form D'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
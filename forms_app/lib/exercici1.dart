import 'dart:math';
import 'package:flutter/material.dart';

class Exercici1 extends StatefulWidget {
  @override
  Excercici1Page createState() => Excercici1Page();
}

class Excercici1Page extends State<Exercici1> { // Ensure the class name matches
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';

  // Function to generate a random color
  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Alpha value (opacity)
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  // Function to show SimpleDialog
  void _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Text introduit:'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_inputText.isNotEmpty
                  ? _inputText
                  : "[ERROR: Null in txtbox] El textbox esta vacio, no se puede mostrar el texto"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show AlertDialog
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Text Introduit:'),
          content: Text(_inputText.isNotEmpty
              ? _inputText
              : "[ERROR: Null in txtbox] El textbox esta vacio, no se puede mostrar el texto"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to show SnackBar
  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(_inputText.isNotEmpty
              ? _inputText
              : "[ERROR: Null in txtbox] El textbox esta vacio, no se puede mostrar el texto")),
    );
  }

  // Function to show Modal Bottom Sheet
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        Size screenSize = MediaQuery.of(context).size;
        return Container(
          width: MediaQuery.of(context).size.width *
              0.9, // Set the width to 80% of the screen width
          padding: EdgeInsets.all(16.0),
          child: Text(_inputText.isNotEmpty
              ? _inputText
              : "[ERROR: Null in txtbox] El textbox esta vacio, no se puede mostrar el texto"),
        );
      },
    );
  }
 
  // Save random colors generated
  List<Color> buttonColors = [];
  
  @override
  void initState() {
    super.initState();
    // Initialize button colors
    buttonColors =   List.generate(4, (index) => _getRandomColor());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excercici #1 Inputs & MessageBox'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First section: Input and label
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: 'Introdueïx el text que vulguis mostrar'),
                    onChanged: (value) {
                      _inputText = _controller.text;
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Mostra el text introduït'),
                ],
              ),
            ),
            // Second section: Four rectangular buttons in a row
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) {
                    String buttonText;
                    Function onPressed;

                    switch (index) {
                      case 0:
                        buttonText = 'Mostra SimpleDialog';
                        onPressed = _showSimpleDialog;
                        break;
                      case 1:
                        buttonText = 'Mostra AlertDialog';
                        onPressed = _showAlertDialog;
                        break;
                      case 2:
                        buttonText = 'Mostra SnackBar';
                        onPressed = _showSnackBar;
                        break;
                      case 3:
                        buttonText = 'Mostra Modal Bottom Sheet';
                        onPressed = _showModalBottomSheet;
                        break;
                      default:
                        buttonText = 'Button ${index + 1}';
                        onPressed = () {};
                    }
                    return GestureDetector(
                      onTap: () => onPressed(),
                      child: Container(
                        width: 250, // Set a wider width for rectangular shape
                        height:
                            50, // Set a smaller height for rectangular shape
                        decoration: BoxDecoration(
                            color: buttonColors[index],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Shadow color
                                offset: Offset(2, 2), // Offset of the shadow
                                blurRadius: 5, // Blur radius
                                spreadRadius: 1, // Spread radius
                              )
                            ]),
                        child: Center(
                          child: Text(
                            '$buttonText',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      );
  }
}
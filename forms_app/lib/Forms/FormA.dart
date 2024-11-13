import 'package:flutter/material.dart';

class FormA extends StatefulWidget {
  const FormA({Key? key}) : super(key: key);

  @override
  State<FormA> createState() => _FormAState();
}

class _FormAState extends State<FormA> {
  String? selectedSpeed;
  String? selectedHighSpeed;
  String? selectedSpeedPastHour;
  String? remarks;
  List<String> selectedSpeedsPastHour = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driving Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please provide the speed of vehicle?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              RadioListTile(
                title: const Text('Above 40 km/h'),
                value: 'above 40km/h',
                groupValue: selectedSpeed,
                onChanged: (value) {
                  setState(() {
                    selectedSpeed = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Below 40 km/h'),
                value: 'below 40km/h',
                groupValue: selectedSpeed,
                onChanged: (value) {
                  setState(() {
                    selectedSpeed = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('0km/h'),
                value: '0km/h',
                groupValue: selectedSpeed,
                onChanged: (value) {
                  setState(() {
                    selectedSpeed = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter remarks',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value ) {
                  setState(() {
                    remarks = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your remarks here',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please provide the high speed of vehicle?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedSpeedPastHour,
                hint: const Text('Select option'),
                items: <String>['High', 'Medium', 'Low']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSpeedPastHour = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
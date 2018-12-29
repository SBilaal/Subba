import 'package:flutter/material.dart';

import './Fixed/subha.dart';
import './Variable/variable_subha.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> dhikrType = ['Fixed', 'Variable'];
  bool mode = true;

  @override
  Widget build(BuildContext context) {
    final List<String> dhikrType = ['Fixed', 'Variable'];

    void _selectedDhikr(String dhikrType) {
      setState(() {
        if (dhikrType == 'Fixed') {
          mode = true;
        } else {
          mode = false;
        }
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Subha'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: _selectedDhikr,
                itemBuilder: (BuildContext context) {
                  return dhikrType.map((String choice) {
                    return PopupMenuItem(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                })
          ],
        ),
        body: mode ? Subha() : VariableSubha(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './variable_subha_counter.dart';
import './variable_counter_view.dart';

class VariableSubha extends StatefulWidget {
  _VariableSubhaState createState() => _VariableSubhaState();
}

class _VariableSubhaState extends State<VariableSubha> {
  VariableSubhaCounter variableSubhaCounter;

  _VariableSubhaState() {
    variableSubhaCounter = VariableSubhaCounter();
  }

  @override
  Widget build(BuildContext context) {
    return VariableCounterView(variableSubhaCounter);
  }
}

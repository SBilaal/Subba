import 'package:flutter/material.dart';

import './subha_counter.dart';
import './counter_view.dart';

class Subha extends StatefulWidget {
  _SubhaState createState() => _SubhaState();
}

class _SubhaState extends State<Subha> {
  SubhaCounter subhaCounter;

  _SubhaState() {
    subhaCounter = SubhaCounter();
  }

  @override
  Widget build(BuildContext context) {
    return CounterView(subhaCounter);
  }
}

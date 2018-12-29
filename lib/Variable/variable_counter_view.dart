import 'package:flutter/material.dart';

import './variable_subha_counter.dart';

class VariableCounterView extends StatefulWidget {
  VariableSubhaCounter variableSubhaCounter;

  VariableCounterView(this.variableSubhaCounter);

  _VariableCounterViewState createState() =>
      _VariableCounterViewState(variableSubhaCounter);
}

class _VariableCounterViewState extends State<VariableCounterView> {
  final VariableSubhaCounter variableSubhaCounter;

  _VariableCounterViewState(this.variableSubhaCounter);

  final myContoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    myContoller.dispose();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter a Maximum Number'),
            content: TextField(
              controller: myContoller,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter a number'),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    variableSubhaCounter.maxCount = int.parse(myContoller.text);
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          );
        });
  }

  Widget _buildTextDisplay() {
    return Expanded(
      flex: 1,
      child: Center(
        child: AnimatedOpacity(
          opacity: variableSubhaCounter.isShowing ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
            child: Text(
              variableSubhaCounter.maxCount.toString(),
              style: TextStyle(fontSize: 50.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCounterView() {
    return Expanded(
      flex: 9,
      child: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                variableSubhaCounter.count.toString(),
                style: TextStyle(fontSize: 200.0, fontWeight: FontWeight.w100),
              ),
              OutlineButton(
                highlightedBorderColor: Theme.of(context).primaryColor,
                color: Theme.of(context).primaryColorLight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'RESET',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    variableSubhaCounter.reset();
                  });
                },
              )
            ],
          ),
        ),
        onTap: () {
          setState(() {
            variableSubhaCounter.setOpacity();
            variableSubhaCounter.dhikrCounter();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        children: <Widget>[
          _buildTextDisplay(),
          _buildCounterView(),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: FractionalOffset.bottomRight,
          child: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: _showDialog,
          ),
        ),
      )
    ]);
  }
}

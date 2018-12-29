import 'package:flutter/material.dart';

import 'subha_counter.dart';

class CounterView extends StatefulWidget {
  SubhaCounter subhaCounter;

  CounterView(this.subhaCounter);

  _CounterViewState createState() => _CounterViewState(subhaCounter);
}

class _CounterViewState extends State<CounterView> {
  SubhaCounter subhaCounter;

  _CounterViewState(this.subhaCounter);


  @override
  void initState() {
    super.initState();
    setState(() {
      subhaCounter.setAppState();
    });
  }

  Widget _buildTextDisplay() {
    return Expanded(
      flex: 1,
      child: Center(
        child: AnimatedOpacity(
          opacity: subhaCounter.isShowing ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
            child: Text(
              subhaCounter.dhikr,
              style: TextStyle(fontSize: 40.0),
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
                subhaCounter.count.toString(),
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
                    subhaCounter.reset();
                  });
                },
              )
            ],
          ),
        ),
        onTap: () {
          setState(() {
            subhaCounter.setOpacity();
            subhaCounter.setDhikr();
            subhaCounter.setDhikrCount();
            subhaCounter.dhikrCounter();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTextDisplay(),
        _buildCounterView(),
      ],
    );
  }
}

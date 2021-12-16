import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:final_app/store/actions.dart' as s;

import 'package:final_app/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  static const actions = [
    s.Actions.incrementFirst,
    s.Actions.incrementSecond,
    s.Actions.incrementThird,
    s.Actions.incrementFourth,
    s.Actions.setZeroAll
  ];

  int tabIndex = 0;
  int selectedTabIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First screen'),
      ),
      body: StoreConnector<List<int>, VoidCallback>(
          converter: (store) => () => store.dispatch(actions[selectedTabIndex]),
          builder: (context, callback) {
            return StoreConnector<List<int>, List<int>>(
              converter: (store) => store.state,
              builder: (context, listOfStates) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                            onPressed: listOfStates[6] == 0
                                ? null
                                : () {
                                    selectedTabIndex = 0;
                                    callback;
                                  },
                            child: Text('${listOfStates[0]}')),
                        TextButton(
                            onPressed: listOfStates[6] == 1
                                ? null
                                : () {
                                    selectedTabIndex = 1;
                                    callback;
                                  },
                            child: Text('${listOfStates[1]}')),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondScreen()),
                              );
                            },
                            child: Text('${listOfStates[0]}')),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                            onPressed: listOfStates[6] == 2
                                ? null
                                : () {
                                    selectedTabIndex = 2;
                                    callback;
                                  },
                            child: Text('${listOfStates[2]}')),
                        TextButton(
                            onPressed: listOfStates[6] == 3
                                ? null
                                : () {
                                    selectedTabIndex = 3;
                                    callback;
                                  },
                            child: Text('${listOfStates[3]}')),
                      ],
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}

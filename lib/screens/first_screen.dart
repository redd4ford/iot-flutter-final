import 'package:final_app/store/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:final_app/store/actions.dart' as s;

import 'package:final_app/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  static const buttonActions = [
    s.Actions.incrementFirst,
    s.Actions.incrementSecond,
    s.Actions.incrementThird,
    s.Actions.incrementFourth
  ];
  Color buttonOnDisabled = Colors.red.shade200;
  Color buttonOnEnabled = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First screen'),
      ),
      body: StoreConnector<Map<String, int>, VoidCallback>(
        converter: (store) => () => store.dispatch(buttonActions),
        builder: (context, callback) {
          return StoreConnector<Map<String, int>, Map<String, int>>(
            converter: (store) => store.state,
            builder: (context, states) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () => setState(
                          () {
                            (states['disabledBtnIndex'] != 1)
                                ? {
                                    reducer(states, buttonActions[0]),
                                  }
                                : {};
                          },
                        ),
                        child: Text('${states['firstBtnCounter']}'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            states['disabledBtnIndex'] == 1
                                ? buttonOnDisabled
                                : buttonOnEnabled,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => setState(
                          () {
                            (states['disabledBtnIndex'] != 2)
                                ? {
                                    reducer(states, buttonActions[1]),
                                  }
                                : {};
                          },
                        ),
                        child: Text('${states['secondBtnCounter']}'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            states['disabledBtnIndex'] == 2
                                ? buttonOnDisabled
                                : buttonOnEnabled,
                          ),
                        ),
                      ),
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
                              builder: (context) => const SecondScreen(),
                            ),
                          );
                        },
                        child: Text('${states['totalCounter']}'),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () => setState(
                          () {
                            (states['disabledBtnIndex'] != 3)
                                ? {
                                    reducer(states, buttonActions[2]),
                                  }
                                : {};
                          },
                        ),
                        child: Text('${states['thirdBtnCounter']}'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            states['disabledBtnIndex'] == 3
                                ? buttonOnDisabled
                                : buttonOnEnabled,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => setState(
                          () {
                            (states['disabledBtnIndex'] != 4)
                                ? {
                                    reducer(states, buttonActions[3]),
                                  }
                                : {};
                          },
                        ),
                        child: Text('${states['fourthBtnCounter']}'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            states['disabledBtnIndex'] == 4
                                ? buttonOnDisabled
                                : buttonOnEnabled,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

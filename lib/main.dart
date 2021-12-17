import 'package:flutter/material.dart';

import 'package:final_app/screens/first_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:final_app/store/reducer.dart';

void main() {
  // first btn counter,
  // second btn counter,
  // third btn counter,
  // fourth btn counter,
  // total counter,
  // disabled btn idx
  final Store<Map<String, int>> store =
      Store<Map<String, int>>(reducer, initialState: {
    'firstBtnCounter': 0,
    'secondBtnCounter': 0,
    'thirdBtnCounter': 0,
    'fourthBtnCounter': 0,
    'totalCounter': 0,
    'disabledBtnIndex': -1
  });
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<Map<String, int>> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Final task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}

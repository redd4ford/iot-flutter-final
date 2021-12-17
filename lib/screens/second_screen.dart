import 'package:final_app/store/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:final_app/store/actions.dart' as s;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StoreConnector<Map<String, int>, Map<String, int>>(
        converter: (store) => store.state,
        builder: (context, states) {
          return StoreConnector<Map<String, int>, VoidCallback>(
            converter: (store) => () => store.dispatch(s.Actions.setZeroAll),
            builder: (context, callback) {
              return Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${states['firstBtnCounter']}',
                        ),
                        Text(
                          '${states['secondBtnCounter']}',
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => setState(() {
                            reducer(states, s.Actions.setZeroAll);
                          }),
                          child: Text('${states['totalCounter']}'),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${states['thirdBtnCounter']}'),
                        Text('${states['fourthBtnCounter']}'),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

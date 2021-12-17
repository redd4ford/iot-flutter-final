import 'package:final_app/store/actions.dart';

Map<String, int> reducer(Map<String, int> state, dynamic action) {
  switch (action) {
    case Actions.incrementFirst:
      state.update('firstBtnCounter', (value) => value + 1);
      state.update('totalCounter', (value) => value + 1);
      state.update('disabledBtnIndex', (value) => 1);
      break;
    case Actions.incrementSecond:
      state.update('secondBtnCounter', (value) => value + 1);
      state.update('totalCounter', (value) => value + 1);
      state.update('disabledBtnIndex', (value) => 2);
      break;
    case Actions.incrementThird:
      state.update('thirdBtnCounter', (value) => value + 1);
      state.update('totalCounter', (value) => value + 1);
      state.update('disabledBtnIndex', (value) => 3);
      break;
    case Actions.incrementFourth:
      state.update('fourthBtnCounter', (value) => value + 1);
      state.update('totalCounter', (value) => value + 1);
      state.update('disabledBtnIndex', (value) => 4);
      break;
    case Actions.setZeroAll:
      state.update('firstBtnCounter', (value) => 0);
      state.update('secondBtnCounter', (value) => 0);
      state.update('thirdBtnCounter', (value) => 0);
      state.update('fourthBtnCounter', (value) => 0);
      state.update('disabledBtnIndex', (value) => -1);
      break;
    default:
      break;
  }
  return state;
}

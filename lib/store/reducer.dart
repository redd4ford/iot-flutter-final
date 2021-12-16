import 'package:final_app/store/actions.dart';

List<int> reducer(List<int> state, dynamic action) {
  switch (action) {
    case Actions.incrementFirst:
      state[0] += 1;
      state[4] += 1;
      state[5] += 1;
      if (state[5] == 4) {
        state[6] = 0;
      }
      break;
    case Actions.incrementSecond:
      state[1] += 1;
      state[4] += 1;
      state[5] += 1;
      if (state[5] == 4) {
        state[6] = 1;
      }
      break;
    case Actions.incrementThird:
      state[2] += 1;
      state[4] += 1;
      state[5] += 1;
      if (state[5] == 4) {
        state[6] = 2;
      }
      break;
    case Actions.incrementFourth:
      state[3] += 1;
      state[4] += 1;
      state[5] += 1;
      if (state[5] == 4) {
        state[6] = 3;
      }
      break;
    case Actions.setZeroAll:
      state[0] = 0;
      state[1] = 0;
      state[2] = 0;
      state[3] = 0;
      state[5] = 0;
      state[6] = -1;
      break;
    default:
      break;
  }
  return state;
}

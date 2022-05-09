import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  // 상태를 넣어주면 됨
  // 외부에서 접근하지 못하도록 private
  int _count = 0;
  int get count => _count;

  add() {
    _count++;
    // 상태값이 변경되었다고 구독하는 모든 것에게 알려줌
    // 반드시 해줘야함 안해주면 변경이 되지 않음
    notifyListeners();
  }

  remove() {
    _count--;
    notifyListeners();
  }
}
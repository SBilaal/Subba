import 'package:vibrate/vibrate.dart';

class VariableSubhaCounter{
  bool isShowing = true;
  int count = 0;
  int maxCount = 100;

  void setOpacity(){
    if(count == maxCount){
      isShowing = false;
    }
    else{
      isShowing = true;
    }
  }

  void reset(){
    count = 0;
    maxCount = 100;
  }

  void dhikrCounter() {
    if (count == maxCount - 1) {
      Vibrate.vibrate();
      count = 0;
    } else {
      count++;
    }
  }
}
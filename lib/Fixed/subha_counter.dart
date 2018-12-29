import 'package:vibrate/vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubhaCounter{
  bool isShowing = true;
  int count = 0;
  int dhikrCount = 0;
  String dhikr = '';
  final List<String> adhkar = ['Subhanallah', 'Alhamdulillah', 'Allahu Akbar'];

  void setAppState() async {
    final prefs  = await SharedPreferences.getInstance();
    isShowing = prefs.getBool('isShowing') ?? isShowing;
    count = prefs.getInt('count') ?? count;
    dhikrCount = prefs.getInt('dhikrCount') ?? dhikrCount;
    dhikr = prefs.getString('dhikr') ?? dhikr;
  }

  void setOpacity(){
    if(count == 32){
      isShowing = false;
    }
    else{
      isShowing = true;
    }
  }

  void setDhikrCount() async {
    if(count == 32){
      dhikrCount++;
    }
    if(dhikrCount > 2){
      dhikr = '';
      dhikrCount = 0;
    }

    final prefs  = await SharedPreferences.getInstance();
    prefs.setBool('isShowing', isShowing);
    prefs.setInt('count', count);
    prefs.setInt('dhikrCount', dhikrCount);
    prefs.setString('dhikr', dhikr);
  }

  void setDhikr(){
    if(dhikrCount == 0){
      dhikr = adhkar[0];
    }
    else if(dhikrCount == 1){
      dhikr = adhkar[1];
    }
    else if(dhikrCount == 2){
      dhikr = adhkar[2];
    }
    else{
      count = 0;
      dhikrCount = 0;
      dhikr = '';
    }
  }

  void reset(){
    count = 0;
    dhikrCount = 0;
    dhikr = '';
  }

  void dhikrCounter() {
    if (count == 32) {
      Vibrate.vibrate();
      count = 0;
    } else {
      count++;
    }
  }
}


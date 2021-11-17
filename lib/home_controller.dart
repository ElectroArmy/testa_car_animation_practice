import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  //Declaring which got locked or unlocked
  //Lesson 3 Code start ,
  //BottomNav ontap with index is 0 or 1, 2, 3,
  int selectedBottomTab = 0;

  void onBottomNavigationTabChange(int index) {
    selectedBottomTab = index;
    notifyListeners();
  }

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBonnetDoorLock = true;
  bool isTrunkDoorLock = true;

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateBonnetDoorLock() {
    isBonnetDoorLock = !isBonnetDoorLock;
    notifyListeners();
  }

  void updateTrunkDoorLock() {
    isTrunkDoorLock = !isTrunkDoorLock;
    notifyListeners();
  }

  bool isCoolSelected = true;

  void updateCoolSelectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  bool isShowTyre = false;

  void showTyreController(int index) {
    //Once user on this tyre tab we want to show the tyre
    // Yea lets define this method on bottomnav
    // as we see we want to show those tyres alittle bit later...

    if (selectedBottomTab != 3 && index == 3) {
      Future.delayed(
        Duration(milliseconds: 400),
        () {
          isShowTyre = true;
          notifyListeners();
        },
      );
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  bool isShowTyreStatus = false; 

  void tyreStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
}

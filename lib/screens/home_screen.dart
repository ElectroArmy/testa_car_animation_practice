import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_animation_part_one/constants.dart';
import 'package:tesla_car_animation_part_one/home_controller.dart';

import 'components/battery_status.dart';
import 'components/door_lock.dart';
import 'components/tesla_bottom_navbar.dart';
import 'components/tmp_btn.dart';
import 'components/tmp_details.dart';

class HomeScreen extends StatefulWidget {
  //Battery and Space photo animation need Stateful State
  //Thats why change stless from stful
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // with => added
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;
//Part 3
  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempShowInfo;
  late Animation<double> _animationCoolGlow;
  //get theme => null;

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    //Lets define animation for car shit
    _animationCarShift = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.2, 0.4),
    );

    _animationTempShowInfo = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.45, 0.65),
    );
    _animationCoolGlow = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.7, 1),
    );
  }

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      // Here the animation ENd on 0.5 / 300 millisec
      curve: Interval(0.0, 0.5),
    );

    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      // After upon ani stop on 0.5 sec => then start 0.6 ... hummm
      // 0.6 == 360 milliseconds => Endon 600 millisec
      curve: Interval(0.6, 1),
    );
  }

  // State and Dispose LEsson 2
  @override
  void initState() {
    setupBatteryAnimation();
    setupTempAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // It rebuild the widget tree when any changes happened on our Controller.

    //This animation needs on listenable => /home_controller
    return AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _batteryAnimationController,
          _tempAnimationController
        ]),
        builder: (context, _) {
          //IF we need to see value on Screen
          // print(_animationBattery.value);

          return Scaffold(
            // AppBar with noti icon here
            // appBar: AppBar(
            //   leading: IconButton(
            //     icon: Icon(
            //       Icons.notification_add_rounded,
            //     ),
            //     onPressed: () => {
            //       print('Set Dark Theme'),
            //       theme.setDarkMode(),
            //     },

            //   ),

            // ),

            // Now time to add Bottom Nav Bar with Extract Method
            bottomNavigationBar: TeslaBottomNavBar(
              onTab: (index) {
                //Lesson 3 Code Controller
                //BottomNav Ontap controller index !=

                //So once user click on battery tab then we want to start animations
                if (index == 1)
                  _batteryAnimationController.forward();
                else if (_controller.selectedBottomTab == 1 && index != 1)
                  _batteryAnimationController.reverse(from: 0.7);
                // We can use _controller.selectedBottomTab == 1
                // bcoz after check it change the tab.
                if (index == 2)
                  _tempAnimationController.forward();
                //Our car position not changed! right
                else if (_controller.selectedBottomTab == 2 && index != 2)
                  _tempAnimationController.reverse(from: 0.4);

                _controller.onBottomNavigationTabChange(index);
              },
              selectedTab: _controller.selectedBottomTab,
            ),

            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                // Lockers rEd
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Part 3 Code start !
                    SizedBox(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                    ),

                    Positioned(
                      left: constrains.maxWidth / 2 * _animationCarShift.value,
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constrains.maxHeight * 0.1),
                        child: SvgPicture.asset("assets/icons/Car.svg",
                            width: double.infinity),
                      ),
                    ),

                    // Bonnets Front Parts Locker
                    // #3 Tuto Animation codes
                    AnimatedPositioned(
                      duration: defaultDuration,
                      //Top from AlignMent
                      top: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.17
                          : constrains.maxWidth / 2,

                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          //MasterHere
                          isLock: _controller.isBonnetDoorLock,
                          press: _controller.updateBonnetDoorLock,
                        ),
                      ),
                    ),

                    //Right Hand Side Door Locked with red color
                    //#3 Lets animate lockMovement now
                    AnimatedPositioned(
                      duration: defaultDuration,
                      //All spaces of width multiply 0.1
                      right: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,

                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        //We need to hide this lock from ontap event
                        //Also animate to Opacity disappear when on tab Battery IconTab
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isRightDoorLock,
                          press: _controller.updateRightDoorLock,
                        ),
                      ),
                    ),

                    // Left Hand Side Locker
                    AnimatedPositioned(
                      duration: defaultDuration,
                      //All spaces of width multiply 0.1
                      // Animated on #3
                      left: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,

                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          //MasterHere Lesson 2
                          isLock: _controller.isLeftDoorLock,
                          press: _controller.updateLeftDoorLock,
                        ),
                      ),
                    ),

                    // Bottom BackParts Locker

                    AnimatedPositioned(
                      duration: defaultDuration,
                      //Bottom from AlignMent
                      bottom: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.26
                          : constrains.maxWidth / 2,

                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          //MasterHere
                          isLock: _controller.isTrunkDoorLock,
                          press: _controller.updateTrunkDoorLock,
                        ),
                      ),
                    ),
                    //SvgPicture.asset("assets/icons/Battery.svg",
                    //width: constrains.maxWidth * 0.34),
                    //This is Battery upon Tesla Car
                    // Need animation and controller.

                    // BATTERY
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset("assets/icons/Battery.svg",
                          width: constrains.maxWidth * 0.34),
                    ),

                    Positioned(
                      // The animation value start at 0 and end on 1,
                      top: 40 * (1 - _animationBatteryStatus.value),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(constrains: constrains),
                      ),
                    ),
                    
                    //Temp
                    Positioned(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      top: 60 * (1 - _animationTempShowInfo.value),
                      child: Opacity(
                          opacity: _animationTempShowInfo.value,
                          child: TempDetails(controller: _controller)),
                    ),
                    
                    Positioned(
                        right: -180 * (1 - _animationCoolGlow.value),
                        child: AnimatedSwitcher(
                            duration: defaultDuration,
                            child: _controller.isCoolSelected
                                ? Image.asset(
                                    "assets/images/Cool_glow_2.png",
                                    key: UniqueKey(),
                                    width: 200,
                                  )
                                : Image.asset(
                                    "assets/images/Hot_glow_4.png",
                                    key: UniqueKey(),
                                    width: 200,
                                  ))),
                  ],
                );
              }),
            ),
          );
        });
  }
}

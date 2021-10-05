import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_animation_part_one/constants.dart';
import 'package:tesla_car_animation_part_one/home_controller.dart';

import 'components/door_lock.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  //Declare homecontroller
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    // It rebuild the widget tree when any changes happened on our Controller.

    //This animation needs on listenable => /home_controller
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                // Lockers rEd
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1),
                      child: SvgPicture.asset("assets/icons/Car.svg",
                          width: double.infinity),
                    ),

  // Bonnets Front Parts Locker
                    Positioned(
                      //Top from AlignMent 
                      top: constrains.maxWidth * 0.17,

                      child: DoorLock(
                        //MasterHere
                        isLock: _controller.isBonnetDoorLock,
                        press: _controller.updateBonnetDoorLock,
                      ),
                    ),


                    //Right Hand Side Door Locked with red color
                    Positioned(
                      //All spaces of width multiply 0.1
                      right: constrains.maxWidth * 0.05,

                      child: DoorLock(
                        isLock: _controller.isRightDoorLock,
                        press: _controller.updateRightDoorLock,
                      ),
                    ),


                    // Left Hand
                    Positioned(
                      //All spaces of width multiply 0.1
                      left: constrains.maxWidth * 0.05,

                      child: DoorLock(
                        //MasterHere
                        isLock: _controller.isLeftDoorLock,
                        press: _controller.updateLeftDoorLock,
                      ),
                    ),
                    

                // Bottom BackParts Locker

                    Positioned(
                      //Bottom from AlignMent 
                      bottom: constrains.maxWidth * 0.26,

                      child: DoorLock(
                        //MasterHere
                        isLock: _controller.isTrunkDoorLock,
                        press: _controller.updateTrunkDoorLock,
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }
}



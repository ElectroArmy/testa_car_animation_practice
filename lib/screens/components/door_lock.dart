import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.press,
    required this.isLock,
  }) : super(key: key);

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //HomeController method,
        onTap: press,
        child: AnimatedSwitcher(
          duration: defaultDuration,
          // Still shows no animations why :P add key: ValueKey("")
          // Now we got what we want !
          // We need add to jumping effect check on flutter dev
          switchInCurve: Curves.easeInOutBack,

          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),

          child: isLock
              ? SvgPicture.asset(
                  "assets/icons/door_lock.svg",
                  key: ValueKey("lock"),
                )
              : SvgPicture.asset(
                  "assets/icons/door_unlock.svg",
                  key: ValueKey("unlock"),
                ),
        ));
  }
}
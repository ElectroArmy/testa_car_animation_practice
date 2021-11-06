import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class TempBtn extends StatelessWidget {
  const TempBtn({
    Key? key,
    required this.svgScr,
    required this.title,
    this.isActive = false, // test for true;
    this.activeColor = primaryColor,
    required this.press,
  }) : super(key: key);

  final String svgScr, title;
  final bool isActive;
  final VoidCallback press;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              // 'assets/icons/coolShape.svg',
              svgScr,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              color: isActive ? activeColor : Colors.white38,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            duration: Duration(microseconds: 200),
            child: Text(
              // 'Cool'.toUpperCase(),
              title.toUpperCase(),
              // style: TextStyle(
              //     fontSize: 16,
              //     color: isActive ? primaryColor : Colors.white38,
              //     fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              //     ),
            ),
          )
        ],
      ),
    );
  }
}

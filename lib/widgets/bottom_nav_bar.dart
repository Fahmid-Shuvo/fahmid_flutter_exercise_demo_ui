import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            svgSrc: 'assets/icons/calendar.svg',
            title: 'Today',
          ),
          BottomNavItem(
            svgSrc: 'assets/icons/gym.svg',
            title: 'All Exercise',
            isActive: true,
          ),
          BottomNavItem(
            svgSrc: 'assets/icons/Settings.svg',
            title: 'Settings',
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final bool isActive;
  final Function press;

  const BottomNavItem(
      {this.svgSrc, this.title, this.isActive = false, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgSrc,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? kActiveIconColor : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

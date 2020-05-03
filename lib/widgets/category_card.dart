import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';


class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;

  const CategoryCard({this.title, this.svgSrc, this.press});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 11),
              blurRadius: 13,
              spreadRadius: -20,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

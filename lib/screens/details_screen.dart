import 'package:exercise_app_ui/constants.dart';
import 'package:exercise_app_ui/widgets/bottom_nav_bar.dart';
import 'package:exercise_app_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage('assets/images/meditation_bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.05),
                    Text(
                      'Meditation',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3-10 Min Course',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        'Live Happier and Healthier by Learning Fundamentals of Meditation & Mindfulness',
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.55,
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SessionCard(
                          sessionNumber: 1,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNumber: 2,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNumber: 3,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNumber: 4,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNumber: 5,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNumber: 6,
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Meditation',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 15),
                            blurRadius: 23,
                            spreadRadius: -15,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/Meditation_women_small.svg',
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Basic 2',
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text('Start your serendepity practice'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset('assets/icons/Lock.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNumber;
  final bool isDone;
  final Function press;

  const SessionCard({
    this.sessionNumber,
    this.isDone = false,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: constraint.maxWidth / 2 - 10,
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 21,
                  spreadRadius: -13,
                  color: kShadowColor,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 45,
                        decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone ? Colors.white : kBlueColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Session $sessionNumber',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

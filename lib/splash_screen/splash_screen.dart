import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:overlay_support/overlay_support.dart';

import '../home.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(
          Text(connected ? "CONNECTED TO INTERNET" : "NO INTERNET"),
          background: connected ? Colors.green : Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.blue),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.blue),
      imagePadding: EdgeInsets.all(20),
      boxDecoration: BoxDecoration(color: Colors.white),
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.blue,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/image1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/image2.png'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],
      onDone: () => goHomepage(context),
      onSkip: () => goHomepage(context),
      showSkipButton: true,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(color: Colors.white),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: Text(
        'Getting Stated',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.white, //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return Home();
    }), (Route<dynamic> route) => false);
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset(
        '$assetName',
        width: 350.0,
        fit: BoxFit.cover,
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}

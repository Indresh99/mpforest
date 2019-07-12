import 'dart:async';

import 'package:flutter/material.dart';

import 'first_page.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), ()=> Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => homepage()),ModalRoute.withName("/home") ));
  }



  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return WillPopScope(
      onWillPop: ()=> Future.value(false),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.green[400],
                      Colors.cyan[200],
                      Colors.cyan[300],
                      Colors.cyan[400]
                    ],
                    stops: [0.1, 0.5, 0.7, 0.9],
                    begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assests/logo.png', scale: 1.3,),
                      SizedBox.fromSize(size: Size(25, 25),),
                      Text(
                        "मध्य प्रदेश वन विभाग, भारत",
                        style: TextStyle(
                          color: Colors.green[600],
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

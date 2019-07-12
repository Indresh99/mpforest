import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'conservancy.dart';
import 'sample.dart';
import 'range.dart';
import 'Division.dart';
import 'subDivision.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:flutter/services.dart';
class homepage extends StatefulWidget {



  @override
  _homepageState createState() => _homepageState();
}


class _homepageState extends State<homepage> {

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  _fun(){

    final snack = new SnackBar(content: Text("Hello"));
    _globalKey.currentState.showSnackBar(snack);
  }

  Future<bool> _backPress(){
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Do you want to Exit"),
        actions: <Widget>[
          FlatButton(onPressed: ()=>Navigator.pop(context, false), child: Text("No", style: TextStyle(color: Colors.black),)),
          FlatButton(onPressed: ()=>Navigator.pop(context,true), child: Text("Yes", style: TextStyle(color: Colors.black),))
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    Radius r = Radius.circular(20.0);
    var radius = 25.0;
    return WillPopScope(
      onWillPop: _backPress,
      child: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person_pin),
              onPressed: () {
                  _showReview(context, "indresh");
              },
            ),
          ],
          backgroundColor: Colors.redAccent,
          title: Text("MP Forest Department"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)),

          )
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              DrawerHeader(


                  child: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assests/logo.png'),
                        backgroundColor: Colors.transparent,
                        radius: 60.0,
                      )
                    ],
          ),
                  ),

                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(bottomLeft: r, bottomRight: r),
                  image: DecorationImage(image: AssetImage('assests/header.jpg'), fit: BoxFit.fill),

                ),

              ),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(12),
                      elevation: 12,
                      color: Colors.white30,
                      child: Text("Welcome to the directory App", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                    ),
                    InkWell(
                      highlightColor: Colors.lightBlue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>sample()));
                      },
                      child: ListTile(
                        title: Text("Information of Conservancy", style: TextStyle(
                          fontSize: 14,
                        ),

                        ),
                        leading: Icon(Icons.ac_unit),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.lightBlue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>subDivision()));
                      },
                      child: ListTile(
                        title: Text("Information of Sub Division", style: TextStyle(
                          fontSize: 14,
                        ),

                        ),
                        leading: Icon(Icons.ac_unit),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.lightBlue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>division()));
                      },
                      child: ListTile(
                        title: Text("Information of Division", style: TextStyle(
                          fontSize: 14,
                        ),

                        ),
                        leading: Icon(Icons.ac_unit),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.lightBlue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Range()));
                      },
                      child: ListTile(
                        title: Text("Information of Range", style: TextStyle(
                          fontSize: 14,
                        ),

                        ),
                        leading: Icon(Icons.ac_unit),
                      ),
                    ),




                  ],

                ),
              ),


            ],
          ),
        ),




        body: Stack(
          children: <Widget>[
            Image.asset('assests/sample.png'),
            Container(
              child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Center(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                              elevation: 12,
                              color: Colors.white70,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.white30,
                                      Colors.white10,
                                      Colors.white12,
                                      Colors.white30,
                                    ]),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                height: 55,
                                width: 55,
                                child: InkWell(
                                  onTap: (){
                                    //write further code
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>sample()));
                                  },

                                  child: Center(
                                    child: Text("Conservancy", style: TextStyle(
                                        color: Colors.black,

                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Times',
                                        fontSize: 26.0
                                    ),),
                                  ),
                                ),
                              )
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                              elevation: 12,
                              color: Colors.white70,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.white30,
                                      Colors.white10,
                                      Colors.white12,
                                      Colors.white30,
                                    ]),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                height: 55,
                                width: 55,
                                child: InkWell(
                                  onTap: (){
                                    //write further code
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>division()));
                                  },

                                  child: Center(
                                    child: Text("Division", style: TextStyle(
                                        color: Colors.black,

                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Times',
                                        fontSize: 26.0
                                    ),),
                                  ),
                                ),
                              )
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                              elevation: 12,
                              color: Colors.white70,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.white30,
                                      Colors.white10,
                                      Colors.white12,
                                      Colors.white30,
                                    ]),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                height: 55,
                                width: 55,
                                child: InkWell(
                                  onTap: (){
                                    //write further code
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>subDivision()));
                                  },

                                  child: Center(
                                    child: Text("Sub Division", style: TextStyle(
                                        color: Colors.black,

                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Times',
                                        fontSize: 26.0
                                    ),),
                                  ),
                                ),
                              )
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                              elevation: 12,
                              color: Colors.white70,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.white30,
                                      Colors.white10,
                                      Colors.white12,
                                      Colors.white30,
                                    ]),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                height: 55,
                                width: 55,
                                child: InkWell(
                                  onTap: (){
                                    //write further code
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Range()));
                                  },

                                  child: Center(
                                    child: Text("Range", style: TextStyle(
                                        color: Colors.black,

                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Times',
                                        fontSize: 26.0
                                    ),),
                                  ),
                                ),
                              )
                          ),

                        ),

                      ],
                    ),
                  )
              ),
              //color: Colors.white,
            ),
          ],
        )
      ),
    );
  }


Future<bool> _showReview(context, review){



    return showDialog(
        context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 420.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                children: <Widget>[
                  Stack(
                  children: <Widget>[
                      Container(
                      height: 150.0,
                    ),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)
                          ),
                          color: Colors.teal
                      ),
                    ),
                    Positioned(
                        top: 50.0,
                        left: 94.0,
                        child: Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(45.0),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0
                                ),
                                image: DecorationImage(
                                    image: AssetImage('assests/po.jpeg'),
                                    fit: BoxFit.cover
                                      )
                                  )
                              )
                          )
                      ],
                    ),

                  Padding(
                      padding: EdgeInsets.only(top: 8.0),
                    child: Text("Indresh Mahor", style: TextStyle(
                      fontFamily: 'Times',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w300
                    ),),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Application Developer", style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: (){
                              _open("https://www.instagram.com/indresh._.mahor/");
                            },
                            child: CircleAvatar(
                              child: Image(image: AssetImage('assests/insta.png')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: (){
                              _open("https://www.linkedin.com/in/indresh-mahor-a49680133/");
                            },
                            child: CircleAvatar(
                              child: Image(image: AssetImage('assests/linked.png')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: (){
                              UrlLauncher.launch("mailto:<indreshmahor99@gmail.com>?subject=News&body=New%20plugin");
                            },
                            child: CircleAvatar(
                              child: Image(image: AssetImage('assests/gmail.png')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: (){
                              _open("whatsapp://send?phone=919826264377");
                            },
                            child: CircleAvatar(
                              child: Image(image: AssetImage('assests/whatsapp.png')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: (){
                              _open("https://www.facebook.com/indresh.mahor");
                            },
                            child: CircleAvatar(
                              child: Image(image: AssetImage('assests/facebook.png')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        int p = int.parse("9826264377");
                        UrlLauncher.launch("tel:$p");
                      },
                      child: Padding(padding: EdgeInsets.all(8.0),child: Icon(Icons.call))),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("With a Computer Science background and interest in software development. I am Indresh Mahor"
                          " fond of developing software and Mobile Applications."
                          " From the Experience of developing applications in various computer languages. I am very proficient in my"
                          " work.", style: TextStyle(
                        fontSize: 12
                      ),),
                    ),
                  )

                ],
              ),
            ),
          );
      }
    );
}
  _open(url) async {

      if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



}

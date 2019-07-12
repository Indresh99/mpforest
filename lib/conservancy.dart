import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:clipboard_manager/clipboard_manager.dart';
import 'model.dart';

class conservancy extends StatefulWidget {
  @override
  _conservancyState createState() => _conservancyState();
}

class _conservancyState extends State<conservancy> {


  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();



  List<Posts> _notes = List<Posts>();

  List data;
  Future<List<Posts>> loadJsonData() async{
    var jsonText = await rootBundle.loadString('assests/conservancy.json');
    var notes = List<Posts>();

      data = json.decode(jsonText);

    for(var not in data){
      notes.add(Posts.fromJson(not));
      //_net.add(_notes[not].conservancy);
    }
    print(_notes);
    return notes;

  }

  @override
  void initState() {
    // TODO: implement initState
    loadJsonData().then((onValue){
        setState(() {
          _notes.addAll(onValue);
        });
      });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Conservancy"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),

          )
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('assests/sample.png', fit: BoxFit.fill,),
          ListView.builder(
            itemBuilder: (BuildContext context, int index){
            var num = _notes[index].mobile;
            var name = _notes[index].conservancy;
            var ph = _notes[index].phone;
            var email = _notes[index].email;
            return index==0 ? _searchBar() : _listItem(index, name, num, ph, email);
              },
            itemCount: _notes.length,

          ),


        ],
      ),

    );
  }

  void _onButtonPressed(String name, String num, String ph, String email) {

    showModalBottomSheet(context: context, builder: (context){

      return Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.lightBlue[900],
            Colors.lightBlue[800],
            Colors.lightBlue[700],
            Colors.lightBlue[900],
            Colors.orangeAccent

          ],
            stops: [0.1, 0.5, 0.7, 0.9, 1.5]
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text("Conservancy: "+name, style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 22,
                  color: Colors.white
                ),),

          ),
              ListTile(
                title: InkWell(
                  onTap: (){
                    _num(num);
                  },
                  child: Text("Mobile: "+num, style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
                leading: IconButton(icon: Icon(Icons.call, color: Colors.white,), onPressed: (){_num(num);}, color: Colors.white,),
                trailing: IconButton(icon: Icon(Icons.content_copy, color: Colors.white,), onPressed: (){clipboard(num);Navigator.pop(context);}),

              ),
              ListTile(
                title: InkWell(
                  onTap: (){
                    _ph(ph);
                  },
                  child: Text("Phone: "+ph, style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
                leading: IconButton(icon: Icon(Icons.call, color: Colors.white,), onPressed: (){_ph(ph);},),
                trailing: IconButton(icon: Icon(Icons.content_copy, color: Colors.white,), onPressed: (){clipboard(ph);Navigator.pop(context);}),

              ),
              ListTile(
                title: InkWell(
                  onTap: (){
                    _email(email);
                  },
                  child: Text("Email: "+email, style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
                leading: IconButton(icon: Icon(Icons.call, color: Colors.white,), onPressed: (){_email(email);},),
                trailing: IconButton(icon: Icon(Icons.content_copy, color: Colors.white,), onPressed: (){clipboard(email);Navigator.pop(context);}),

              ),
            ],
          ),
        ),
      );
    });

  }
  void clipboard(String num){
    ClipboardManager.copyToClipBoard(num).then((result) {
      final snackBar = SnackBar(
        content: Text('Copied to Clipboard'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      _globalKey.currentState.showSnackBar(snackBar);
    });

    }

  _num(String num){
    int p = int.parse(num);
    UrlLauncher.launch("tel:$p");
  }
  _ph(String ph){
    UrlLauncher.launch("tel:$ph");
  }
  _email(String email){
    UrlLauncher.launch("mailto:<$email>?subject=News&body=New%20plugin");
  }

  _searchBar() {

      return Padding(padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...'
          ),
          onChanged: (text){
            text = text.toLowerCase();
            setState(() {
              _notes = _notes.where((note){
                var con = note.conservancy.toLowerCase();
                print(con);
                if(con.contains(text)){
                  _notes.clear();
                  print(text);
                }
              });


            });
          },
        ),
      );

  }

  _listItem(int i, String name, String num, String ph, String email) {
          return Padding(
            padding: EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              elevation: 18.0,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: (){
                    _onButtonPressed(name, num, ph, email);
                  },
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text("S No: " +_notes[i].sno.toString(), style: TextStyle(
                          fontSize: 20,

                          fontFamily: 'Times',
                          fontStyle: FontStyle.normal,

                        ),
                        ),

                      ),
                      Container(
                        child: Text("Conservancy: "+_notes[i].conservancy, style: TextStyle(
                          fontSize: 20,

                          fontFamily: 'Times',
                          fontStyle: FontStyle.normal,

                        ),),
                      ),
                      Container(
                        child: Text("Mobile: "+_notes[i].mobile, style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Times',
                          fontStyle: FontStyle.normal,

                        ),),
                      ),
                      Container(
                        child: Text("Phone: "+_notes[i].phone, style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Times',
                          fontStyle: FontStyle.normal,

                        ),),
                      ),
                      Container(
                        child: Text("Email: "+_notes[i].email, style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Times',
                          fontStyle: FontStyle.normal,

                        ),),
                      ),
                      Container(
                        child: Text("Fax: "+_notes[i].fax, style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Times',
                          fontStyle: FontStyle.normal,

                        ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),

    );

  }

  /*void filterSearchResults(String text) {
    List<Posts> dummy = List<Posts>();
    dummy.addAll(_notes);
    if(text.isNotEmpty){
      List<Posts> dummyList = List<Posts>();
      dummy.forEach((notes){
        if(notes.conservancy(text)){
          dummyList.add(notes);
        }
      });
      setState(() {
        _notes.clear();
        _notes.addAll(dummyList);
      });
      return;
    }else{
      setState(() {
        _notes.clear();
        _notes.addAll(_notes);
      });
    }

  }*/

  }


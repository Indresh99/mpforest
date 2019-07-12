import 'package:flutter/material.dart';
import 'DivisionModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:clipboard_manager/clipboard_manager.dart';


class division extends StatefulWidget {
  @override
  _divisionState createState() => _divisionState();
}

class _divisionState extends State<division> {

  ScrollController _controller;
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();



  List<DivisionModel> _notes = List<DivisionModel>();
  List<DivisionModel> _notesForDisplay = List<DivisionModel>();


  List data;
  Future<List<DivisionModel>> loadJsonData() async{
    var jsonText = await rootBundle.loadString('assests/DivisionJson.json');
    var notes = List<DivisionModel>();

    data = json.decode(jsonText);

    for(var not in data){
      notes.add(DivisionModel.fromJson(not));
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
        //_notesForDisplay = _notes;
      });
    });
    _controller = ScrollController();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text("Division"),
          elevation: 24,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _moveUp();
          },
          child: Icon(Icons.keyboard_arrow_up, color: Colors.white,),
          backgroundColor: Colors.lightBlue,
          tooltip: "Reach Top",
          elevation: 12,
        ),
        body: Column(
          children: <Widget>[
            _searchBar(),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemBuilder: (context, index){
                  return _listItem(index);
                },
                itemCount: _notesForDisplay.length,
              ),
            ),
          ],
        )


    );
  }


  _listItem(index){
    return InkWell(
      onTap: (){
        _onButtonPressed(index);
      },
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 12,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Row(
                children: <Widget>[
                  Material(
                    child: Text(_notesForDisplay[index].sno.toString()+".", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ],
              ),*/
              Padding(
                padding: EdgeInsets.all(6),
                child: Text(_notesForDisplay[index].div_EName, style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              /*Padding(
                padding: EdgeInsets.all(6),
                child: Text(_notesForDisplay[index].div_HName, style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Std: "+_notesForDisplay[index].std.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Phone: "+_notesForDisplay[index].phoneNO.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Mobile: "+_notesForDisplay[index].mobileNO.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Fax: "+_notesForDisplay[index].fax),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Email: "+_notesForDisplay[index].email),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search..."
        ),
        onChanged: (text){
          text = text.toLowerCase();
          setState(() {
            if(text.isEmpty) {
              //_notesForDisplay.clear();
              _notesForDisplay.clear();
            }
            else {
              _notesForDisplay = _notes.where((note) {
                var tile = note.div_EName.toLowerCase();
                return tile.contains(text);
              }).toList();
            }
          });
        },
      ),
    );
  }

  void _onButtonPressed(index) {

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
                title: Text("Division: "+_notesForDisplay[index].div_EName, style: TextStyle(
                    fontFamily: 'Times',
                    fontSize: 22,
                    color: Colors.white
                ),),

              ),
              ListTile(
                title: Text("Division: "+_notesForDisplay[index].div_HName, style: TextStyle(
                    fontFamily: 'Times',
                    fontSize: 22,
                    color: Colors.white
                ),),

              ),
              ListTile(
                title: InkWell(
                  onTap: (){
//                    _num(_notesForDisplay[index].subDiv_HName);
                  },
                  child: Text("STD: "+_notesForDisplay[index].std.toString(), style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: (){
//                    _num(_notesForDisplay[index].subDiv_HName);
                  },
                  child: Text("Fax: "+_notesForDisplay[index].fax, style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: (){
                    _num(_notesForDisplay[index].mobileNO.toString());
                  },
                  child: Text("Mobile: "+_notesForDisplay[index].mobileNO.toString(), style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
                leading: IconButton(icon: Icon(Icons.call, color: Colors.white,), onPressed: (){_num(_notesForDisplay[index].mobileNO.toString());}, color: Colors.white,),
                trailing: IconButton(icon: Icon(Icons.content_copy, color: Colors.white,), onPressed: (){clipboard(_notesForDisplay[index].mobileNO.toString());Navigator.pop(context);}),

              ),
              ListTile(
                title: InkWell(
                  onTap: (){
                    _ph(_notesForDisplay[index].std.toString()+"-"+_notesForDisplay[index].phoneNO.toString());
                  },
                  child: Text("Phone: "+_notesForDisplay[index].std.toString()+"-"+_notesForDisplay[index].phoneNO.toString(), style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
                leading: IconButton(icon: Icon(Icons.call, color: Colors.white,), onPressed: (){_ph(_notesForDisplay[index].std.toString()+"-"+_notesForDisplay[index].phoneNO.toString());},),
                trailing: IconButton(icon: Icon(Icons.content_copy, color: Colors.white,), onPressed: (){clipboard(_notesForDisplay[index].std.toString()+"-"+_notesForDisplay[index].phoneNO.toString());Navigator.pop(context);}),

              ),
              ListTile(
                title: InkWell(
                  onTap: (){
                    _email(_notesForDisplay[index].email);
                  },
                  child: Text("Email: "+_notesForDisplay[index].email, style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Times',
                    fontStyle: FontStyle.normal,

                  ),),
                ),
                leading: IconButton(icon: Icon(Icons.call, color: Colors.white,), onPressed: (){_email(_notesForDisplay[index].email);},),
                trailing: IconButton(icon: Icon(Icons.content_copy, color: Colors.white,), onPressed: (){clipboard(_notesForDisplay[index].email);Navigator.pop(context);}),

              ),
            ],
          ),
        ),
      );
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

  void _moveUp() {
    _controller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }


}

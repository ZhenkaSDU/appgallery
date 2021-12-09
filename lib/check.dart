import 'dart:convert';
import 'package:appgallery/get_api.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();

}

class _CheckState extends State<Check> {

  Box box = Hive.box('complete');
  List<GetApi> _notes = List();

  Future<dynamic> getAllLocations() async {
    Response response;

    if(box.isEmpty) {
      response = await get(
          Uri.parse('https://jsonplaceholder.typicode.com/todos'));
          box.put('allData', response.body);
    }
    var notesJson = json.decode(box.get('allData'));

    for (var noteJson in notesJson) {
      _notes.add(GetApi.fromJson(noteJson));
      if(!box.containsKey(_notes.last.id.toString()))
        box.put(_notes.last.id.toString(), _notes.last.completed.toString());
    }

    return _notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0F0B21),
        appBar: AppBar(
          title: Text('Check',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,

            ),),
          centerTitle: true,
          backgroundColor: Color(0xff231d49),
          toolbarHeight: 60,
        ),

        body: Container(
          child: FutureBuilder(
              future: getAllLocations(),
              builder: (context,snapshot) {
                if (snapshot.hasData){
                  return ListView.builder(itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 32,
                                color: box.get((index+1).toString()) == 'true' ? Color(0xff6C63FF) : Color(0xff0F0B21),
                                height: 52,
                                child: Row(
                                  children: <Widget>[
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor: Color(
                                              0xffDADADA)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Checkbox(
                                            checkColor: Color(0xff231d49),
                                            activeColor: Color(0xffDADADA),
                                            splashRadius: 10,
                                            value:  box.get(snapshot.data[index].id.toString())=='true' ? true : false,
                                            onChanged: (value) {
                                              setState(() {
                                                snapshot.data[index].completed = value;
                                                box.put(snapshot.data[index].id.toString(), snapshot.data[index].completed.toString());
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width - 106,
                                      child: Text(
                                        '${snapshot.data[index].title}',
                                        // 'Joni',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xffDADADA),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }
                  );
                }
                else {
                  return
                    SpinKitFadingFour(
                      color: Colors.white,
                      size: 80,
                    );
                }
              }
          ),
        )
    );
  }
}

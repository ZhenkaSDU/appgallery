import 'dart:convert';
import 'dart:core';
import 'package:appgallery/get_сontacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'Profile.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {


  List<GetContacts> _notes = List();
  Box box = Hive.box('contact');
  Future<List<GetContacts>> getContacts() async {
    Response response;
    if(box.isEmpty) {
      response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      box.put('allContacts', response.body);
    }
    var getContacts = box.get('allContacts');
    
    return welcomeFromJson(getContacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0F0B21),
        appBar: AppBar(
          title: Text('Contacts',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,

            ),),
          centerTitle: true,
          backgroundColor: Color(0xff231d49),
          toolbarHeight: 60,


        ),
        body:  Stack(
          children: [
            Container(
                child: FutureBuilder(
                    future: getContacts(),
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(31, 18, 20,0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        new MaterialPageRoute(builder: (context) =>
                                            Profile(snapshot.data[index]))
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Image(image: AssetImage('img/vector.png'),),
                                                  SizedBox(width: 28),
                                                  Text(snapshot.data[index].name, style: TextStyle(fontSize:16,fontFamily: 'Raleway', color: Color(0xffDADADA)),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                )
            ),
            // InkWell(
            //   onTap: () {
            //     print('HELLO!');
            //   },
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     color: Colors.red,
            //   ),
            // ),
          ],
        )
    );
  }
}
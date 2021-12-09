import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

import 'get_сontacts.dart';

class Profile extends StatelessWidget {

  GetContacts getContacts;

  Profile(this.getContacts);


  // _ProfileState(this.getContacts);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0B21),
      appBar: AppBar(
        title: Text(getContacts.username,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
          ),),
        centerTitle: true,
        backgroundColor: Color(0xff231d49),
        toolbarHeight: 60,
      ),
      body: Container(
          child: Center(child: SizedBox.expand(
              child: Container(
                  // padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(height: 30),
                        Center(
                          child: Icon(Icons.account_circle, size: 100,
                            color: Colors.white,),
                        ),
                        SizedBox(height: 25),
                        Center(
                          child: Text(getContacts.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                color: Colors.white
                            ),),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: Text(getContacts.email, style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              color: Color(0xff6C63FF)
                          ),),
                        ),
                        SizedBox(height: 40,),
                        SizedBox(height: 30),
                        Stack(
                            children: <Widget>[
                              Container(
                                height: 57,
                                margin: EdgeInsets.fromLTRB(
                                    24, 6, 24, 0),
                                padding: EdgeInsets.fromLTRB(
                                    15, 17, 0, 18),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    left: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    right: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: Row(
                                    children: [
                                      Text(
                                          getContacts.email,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Raleway')
                                      )
                                    ]
                                ),
                              ),
                              Positioned(
                                  left: 36,
                                  top: -1,
                                  child: Container(
                                      color: Color(0xff0F0B21),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'E-mail', style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff7F78A7)),),
                                      )
                                  )
                              ),
                            ]
                        ),

                        SizedBox(height: 30),
                        Stack(
                            children: <Widget>[
                              Container(
                                height: 57,
                                margin: EdgeInsets.fromLTRB(
                                    24, 6, 24, 0),
                                padding: EdgeInsets.fromLTRB(
                                    15, 17, 0, 18),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    left: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    right: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: Row(
                                    children: [
                                      Text(
                                          getContacts.phone,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Raleway')
                                      )
                                    ]
                                ),
                              ),
                              Positioned(
                                  left: 36,
                                  top: -1,
                                  child: Container(
                                      color: Color(0xff0F0B21),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Phone number', style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff7F78A7)),),
                                      )
                                  )
                              ),
                            ]
                        ),
                        SizedBox(height: 30),
                        Stack(
                            children: <Widget>[
                              Container(
                                height: 57,
                                margin: EdgeInsets.fromLTRB(
                                    24, 6, 24, 0),
                                padding: EdgeInsets.fromLTRB(
                                    15, 16, 0, 18),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    left: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    right: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: Row(
                                    children: [
                                      Text(
                                          getContacts.website,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Raleway')
                                      )
                                    ]
                                ),
                              ),
                              Positioned(
                                  left: 36,
                                  top: -1,
                                  child: Container(
                                      color: Color(0xff0F0B21),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Website', style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff7F78A7)),),
                                      )
                                  )
                              ),
                            ]
                        ),
                        SizedBox(height: 30),
                        Stack(
                            children: <Widget>[
                              Container(
                                height: 57,
                                margin: EdgeInsets.fromLTRB(
                                    24, 6, 24, 0),
                                padding: EdgeInsets.fromLTRB(
                                    15, 16, 0, 18),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    left: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    right: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: Row(
                                    children: [
                                      Text(
                                          getContacts.company.name,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Raleway')
                                      )
                                    ]
                                ),
                              ),
                              Positioned(
                                  left: 36,
                                  top: -1,
                                  child: Container(
                                      color: Color(0xff0F0B21),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Company', style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff7F78A7)),),
                                      )
                                  )
                              ),
                            ]
                        ),
                        SizedBox(height: 30),
                        Stack(
                            children: <Widget>[
                              Container(
                                height: 57,
                                margin: EdgeInsets.fromLTRB(
                                    24, 6, 24, 0),
                                padding: EdgeInsets.fromLTRB(
                                    15, 16, 0, 18),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    left: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    right: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Color(0xff7F78A7)),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: Row(
                                    children: [
                                      Text(
                                          getContacts.address.street +
                                              getContacts.address.suite,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Raleway')
                                      )
                                    ]
                                ),
                              ),
                              Positioned(
                                  left: 36,
                                  top: -1,
                                  child: Container(
                                      color: Color(0xff0F0B21),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Adress', style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff7F78A7)),),
                                      )
                                  )
                              ),
                            ]
                        ),
                        SizedBox(height: 31,),
                        Container(
                          height: 300,
                          width: 200,
                          child:
                          GoogleMap(initialCameraPosition:
                          CameraPosition(
                            target: LatLng(
                                double.parse(getContacts.address.geo.lat),
                                double.parse(getContacts.address.geo.lng)),
                            zoom: 15,
                          ),
                          ),
                        ),
                        SizedBox(height: 33,),
                      ]
                  )
              )
          )
          )
      ),
    );
  }
}
import 'package:appgallery/Profile.dart';
import 'package:appgallery/news.dart';
import 'package:flutter/material.dart';
import 'package:appgallery/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('complete');
  await Hive.openBox('contact');
  await Hive.openBox('news');
  await Hive.openBox('posts');
  await Hive.openBox('gallery');
  await Hive.openBox('photo');
  runApp(MaterialApp(
    home: Home(),
  ));
}


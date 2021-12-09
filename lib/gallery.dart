import 'package:appgallery/get_album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'images.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  Box box = Hive.box('gallery');
  Response response;

  ScrollController scrollController = ScrollController();
  Future<List<GetAlbum>> getalbum() async {
    Response response;
    if (box.isEmpty) {
      response =
      await get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      box.put('allalbum', response.body);
    }

    var getalbum = box.get('allalbum');
    return welFromJson(getalbum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0F0B21),
        appBar: AppBar(
          title: Text('Gallery',
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
              future: getalbum(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Container(
                            child: new StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              controller: scrollController,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: new Center(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          Images(snapshot
                                                              .data[index])
                                                  ));
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius
                                                          .circular(
                                                          4.0),
                                                      child: Image(
                                                        image: AssetImage(
                                                            'img/album.png'),
                                                      )
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom : 8,
                                                  left : 16,
                                                  child: Container(
                                                      width : (MediaQuery.of(context).size.width - 40) / 2 - 16,
                                                      child: Text(snapshot.data[index].title, style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: 'Raleway',
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                        overflow: TextOverflow.ellipsis,
                                                      )),
                                                )
                                              ],
                                            )
                                        )
                                    )
                                );
                              },
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.count(1, 1),
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                else{
                  return SpinKitFadingFour(
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
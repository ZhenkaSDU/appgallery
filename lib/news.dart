import 'package:appgallery/get_posts.dart';
import 'package:appgallery/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  Box box = Hive.box('news');

  Future<List<GetPosts>> getPosts() async {
    Response response;
    if(box.isEmpty) {
      response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      box.put('allNews', response.body);
    }

    var getNews = box.get('allNews');

    return welcomeFromJson(getNews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0F0B21),
        appBar: AppBar(
          title: Text('News',
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
              future: getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (context) =>
                                      Posts(snapshot.data[index]))
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 32,
                              decoration: BoxDecoration(
                                color: Color(0xff221C44),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              padding: EdgeInsets.fromLTRB(16, 16, 32, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    snapshot.data[index].body,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: false,
                                    style: TextStyle(
                                      color: Color(0xffffffff).withOpacity(0.8),
                                      fontSize: 14,
                                      fontFamily: 'Raleway',
                                    ),
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
          ),
        )
    );
  }
}

import 'package:appgallery/contacts.dart';
import 'package:appgallery/gallery.dart';
import 'package:flutter/material.dart';
import 'check.dart';
import 'news.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  List <Widget> _screen = [News() , Gallery(), Check(), Contacts()];
  int _selectedIndex = 0;
  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  void itemTap(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
    // print(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: _pageController,
          children: _screen,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: itemTap,
        // unselectedItemColor: Colors.grey,
        // selectedItemColor: Colors.white,
        backgroundColor: Color(0xff231d49),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey,
            ),
            title: Text('News',style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 9,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey
            ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,color: _selectedIndex == 1 ? Colors.white : Colors.grey,),
            title: Text('Gallery',style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 9,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey
            ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border,color: _selectedIndex == 2 ? Colors.white : Colors.grey,),
            title: Text('Check',style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 9,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey
            ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar,color: _selectedIndex == 3 ? Colors.white : Colors.grey,),
            title: Text('Contacts',style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 9,
                color: _selectedIndex == 3 ? Colors.white : Colors.grey
            ),),
          ),

          // BottomNavigationBarItem(
          //     icon: Icon(Icons.dashboard),
          //     // ignore: deprecated_member_use
          //     title: Text('gallery',style: TextStyle(
          //         fontFamily: 'Raleway',
          //         fontSize: 9
          //     ),),
          //     backgroundColor: Color(0xff322C54)
          // ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite_border),
          //     // ignore: deprecated_member_use
          //     title: Text('check',style: TextStyle(
          //         fontFamily: 'Raleway',
          //         fontSize: 9
          //     ),),
          //     backgroundColor: Color(0xff322C54)
          // ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.perm_contact_calendar),
          //     // ignore: deprecated_member_use
          //     title: Text('contacts',style: TextStyle(
          //         fontFamily: 'Raleway',
          //         fontSize: 9
          //     ),),
          //     backgroundColor: Color(0xff322C54)
          // )
        ],
      ),
    );
  }
}

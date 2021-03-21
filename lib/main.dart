import 'package:covid/Chat.dart';
import 'adviceScreen.dart';
import 'contacts.dart';
import 'countries.dart';
import 'homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  Widget callPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return AdviceScreen();
      case 2:
        return Countries();
      case 4:
        return Contacts();
      case 3:
        return Chat();
        break;
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(238, 72, 93, 1)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          fixedColor: Colors.pink,
          currentIndex: _currentIndex,
          selectedFontSize: 12,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(

                icon: SvgPicture.asset(
                  'assets/images/home.svg',
                  color: _currentIndex == 0 ? Colors.pink : Colors.black87,
                  width: 28,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontFamily: 'Balsamiq Sans Regular',
                      color: _currentIndex == 0 ? Colors.pink : Colors.black87),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/paper.svg',
                  color: _currentIndex == 1 ? Colors.pink : Colors.black87,
                  width: 28,
                ),
                title: Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'Balsamiq Sans Regular',
                      color: _currentIndex == 1 ? Colors.pink : Colors.black87),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/world.svg',
                  color: _currentIndex == 2 ? Colors.pink : Colors.black87,
                  width: 28,
                ),
                title: Text(
                  'Countries',
                  style: TextStyle(
                      fontFamily: 'Balsamiq Sans Regular',
                      color: _currentIndex == 2 ? Colors.pink : Colors.black87),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/comment.svg',
                  color: _currentIndex == 3 ? Colors.pink : Colors.black87,
                  width: 28,
                ),
                title: Text(
                  'Chats',
                  style: TextStyle(
                      fontFamily: 'Balsamiq Sans Regular',
                      color: _currentIndex == 3 ? Colors.pink : Colors.black87),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/phone-4.svg',
                  color: _currentIndex == 4 ? Colors.pink : Colors.black87,
                  width: 28,
                ),
                title: Text(
                  'Contacts',
                  style: TextStyle(
                      fontFamily: 'Balsamiq Sans Regular',
                      color: _currentIndex == 4 ? Colors.pink : Colors.black87),
                )),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
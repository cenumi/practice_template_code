import 'package:flutter/material.dart';
import 'pages/airplay_page.dart';
import 'pages/home_page.dart';
import 'pages/email_page.dart';


void main() => runApp(BottomNavPage());

class BottomNavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bottem Nav Bar',
        theme: ThemeData.light(),
        home: BottomNavWidget());
  }
}

class BottomNavWidget extends StatefulWidget {
  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {

  final _bottomNavColor = Colors.blue;

  var _curIndex = 0;
  var _pages = <Widget>[];

  @override
  void initState() {

    _pages
      ..add(HomePage())
      ..add(EmailPage())
      ..add(AirplayPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: _bottomNavColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _bottomNavColor,
              ),
              title: Text(
                'Airplay',
                style: TextStyle(color: _bottomNavColor),
              ))
        ],
      ),
    );
  }
}

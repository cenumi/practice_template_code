import 'package:flutter/material.dart';
import 'pages/airplay_page.dart';
import 'pages/home_page.dart';
import 'pages/email_page.dart';

void main() => runApp(BottomNavPageCustom());

class BottomNavPageCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bottem Nav Bar Custom',
        theme: ThemeData.light(),
        home: BottomNavWidgetCustom());
  }
}

class BottomNavWidgetCustom extends StatefulWidget {
  @override
  _BottomNavWidgetCustomState createState() => _BottomNavWidgetCustomState();
}

class _BottomNavWidgetCustomState extends State<BottomNavWidgetCustom> {
  var _curIndex = 0;
  var _pages = <Widget>[];

  @override
  void initState() {
    _pages..add(HomePage())..add(AirplayPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_curIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return EmailPage();
          }));
        },
        tooltip: 'Tips!!',
        child: Icon(
          Icons.email,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _curIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _curIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/counter_page.dart';

void main() => runApp(TabNavPage());

class TabNavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Nav',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: TabNavWidget(),
    );
  }
}

class TabNavWidget extends StatefulWidget {
  @override
  _TabNavWidgetState createState() => _TabNavWidgetState();
}

class _TabNavWidgetState extends State<TabNavWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Nav'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.email),
            ),
            Tab(
              icon: Icon(Icons.airplay),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        CounterPage(),
        CounterPage(),
        CounterPage(),
      ]),
    );
  }
}

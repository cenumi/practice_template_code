import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage>
    with AutomaticKeepAliveClientMixin {
  var _num = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$_num'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _num++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(WrapLayout());

class WrapLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap Layout',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: WrapLayoutWidget(),
    );
  }
}

class WrapLayoutWidget extends StatefulWidget {
  @override
  _WrapLayoutWidgetState createState() => _WrapLayoutWidgetState();
}

class _WrapLayoutWidgetState extends State<WrapLayoutWidget> {
  var _list = <Widget>[];

  @override
  void initState() {
    _list..add(_buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Layout'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: _list,
              spacing: 26,
            ),
          ),
        ),
      ),
    );
  }

  _buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (_list.length < 9) {
          setState(() {
            _list.insert(_list.length - 1, _buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.grey,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  _buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.lightBlue,
        child: Center(
          child: Text('photo'),
        ),
      ),
    );
  }
}

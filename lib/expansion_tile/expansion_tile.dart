import 'package:flutter/material.dart';

void main() => runApp(ExpansionTilePage());

class ExpansionTilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expansion Tile',
      theme: ThemeData.dark(),
      home: ExpansionTileWidget(),
    );
  }
}

class ExpansionTileWidget extends StatefulWidget {
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Tile'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('Click to expand'),
          leading: Icon(Icons.accessibility),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text('List Tile'),
              subtitle: Text('Sub Title'),
            )
          ],
        ),
      ),
    );
  }
}

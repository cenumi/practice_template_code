import 'package:flutter/material.dart';

void main() => runApp(CirclePathPage());

class CirclePathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Path',
      theme: ThemeData.dark(),
      home: CirclePathWidget(),
    );
  }
}

class CirclePathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: CirclePath(),
            child: Container(
              color: Colors.blue,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
//      ..lineTo(0, 0)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

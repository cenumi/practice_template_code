import 'package:flutter/material.dart';

void main() => runApp(WavePathPage());

class WavePathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave Path',
      theme: ThemeData.dark(),
      home: WavePathWidget(),
    );
  }
}

class WavePathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: WavePath(),
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

class WavePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
//      ..lineTo(0, 0)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 50)
      ..quadraticBezierTo(size.width / 4 * 3, size.height - 100, size.width, size.height - 50)
      ..lineTo(size.width, 0);

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

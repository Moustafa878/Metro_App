import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height);
    var firstcontrol = new Offset(size.width / 4, size.height);
    var firstend = new Offset(size.width / 2.25, size.height - 30);
    path.quadraticBezierTo(
        firstcontrol.dx, firstcontrol.dy, firstend.dx, firstend.dy);

    var secondcontrol =
    new Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondend = new Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
        secondcontrol.dx, secondcontrol.dy, secondend.dx, secondend.dy);

    //path.quadraticBezierTo(
    //  size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
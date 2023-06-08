import 'package:flutter/widgets.dart';

class Mediumtxt extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  Mediumtxt({ Key? key,
    this.color = const Color(0xFF97723F),
    required this.text,
    this.size = 20,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w900),
    );
  }
}
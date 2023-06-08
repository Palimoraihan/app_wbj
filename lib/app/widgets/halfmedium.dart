import 'package:flutter/widgets.dart';

class Halfmedium extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double heigh;
  TextOverflow textOverflow;
  
  Halfmedium({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 16,
    this.heigh = 1.2,
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
          height: heigh,
          fontWeight: FontWeight.w700),
    );
  }
}
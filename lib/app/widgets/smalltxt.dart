import 'package:flutter/widgets.dart';

class Smalltext extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double heigh;
  TextOverflow textOverflow;
  TextAlign textAlign;
  Smalltext({
    Key? key,
    this.color = const Color(0xFF97723F),
    required this.text,
    this.size = 12,
    this.heigh = 1.2,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.justify
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          height: heigh,
          fontWeight: FontWeight.w100),
    );
  }
}

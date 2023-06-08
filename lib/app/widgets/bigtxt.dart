import 'package:flutter/widgets.dart';

class Bigtext extends StatelessWidget {
  Color? color;
  final String text;
  double size;

  Bigtext({
    Key? key,
    this.color = const Color(0xFF4E342E),
    required this.text,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w900),
    );
  }
}

import 'package:flutter/cupertino.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressed;
  
  const LinkButton({super.key, required this.text, required this.color, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed:onPressed,
        child: Text(
          text,
          style: TextStyle(color: color),
        ));
  }
}

import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(14)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 26),
            ))));
  }
}

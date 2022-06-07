import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.keyColor,
    required this.keyText,
    required this.onPress,
    Key? key,
  }) : super(key: key);
  final Color keyColor;
  final String keyText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: keyColor,
        child: TextButton(
          child: Text(keyText),
          onPressed: onPress,
          //style: TextButton.styleFrom(),
        ),
      ),
    );
  }
}

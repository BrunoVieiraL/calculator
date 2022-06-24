import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.keyColor,
    required this.keyTextColor,
    required this.keyText,
    this.keySize,
    required this.onPress,
    required this.customFlex,
  }) : super(key: key);
  final Color keyColor;
  final Color keyTextColor;
  final String keyText;
  final double? keySize;
  final int customFlex;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: customFlex,
      child: Container(
        margin: const EdgeInsets.all(2),
        color: keyColor,
        child: TextButton(
          child: Text(
            keyText,
            style: TextStyle(color: keyTextColor, fontSize: keySize),
          ),
          onPressed: onPress,
          //style: TextButton.styleFrom(),
        ),
      ),
    );
  }
}

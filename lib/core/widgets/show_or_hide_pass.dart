import 'package:flutter/material.dart';

class ShowOrHidePass extends StatelessWidget {
  const ShowOrHidePass({
    super.key,
    required this.onToggle,
    required this.obsecureText,
  });
  final VoidCallback onToggle;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: obsecureText
          ? Icon(Icons.remove_red_eye)
          : Icon(Icons.remove_red_eye_outlined),
    );
  }
}

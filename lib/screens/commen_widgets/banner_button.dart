// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class banerButton extends StatelessWidget {
  banerButton({
    super.key,
    required this.screenSize,
    required this.buttonIcon,
    required this.buttonLabel,
    required this.BackgroundColor,
    required this.forgroudColor,
  });
  String buttonLabel;
  IconData buttonIcon;
  final Size screenSize;
  Color forgroudColor;
  Color BackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BackgroundColor, borderRadius: BorderRadius.circular(9)),
      width: screenSize.width * 0.35,
      height: screenSize.height * 0.049,
      child: Center(
        child: TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  buttonIcon,
                  size: 20,
                  color: forgroudColor,
                ),
                Text(
                  '$buttonLabel',
                  style: TextStyle(color: forgroudColor),
                )
              ],
            )),
      ),
    );
  }
}

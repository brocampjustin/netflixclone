import 'package:flutter/material.dart';
import 'package:netflix/color/colors.dart';

class subHeddings extends StatelessWidget {
  const subHeddings({
    super.key,
    required this.screenSize,
    required this.heddingText,
  });
  final String heddingText;
  final Size screenSize;
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        heddingText,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: screenSize.height * 0.028,
            color: MyColors.textColor),
      ),
    );
  }
}

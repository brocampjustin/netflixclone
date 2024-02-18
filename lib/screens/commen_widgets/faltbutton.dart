import 'package:flutter/material.dart';
import 'package:netflix/color/colors.dart';

// ignore: must_be_immutable
class MyflatButton extends StatelessWidget {
  MyflatButton({
    super.key,
    required this.isSelected,
    required this.buttonlabel,
  });

  String buttonlabel;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      // ignore: sort_child_properties_last
      child: isSelected
          ? Container(
              child: Row(
              children: [
                Text(
                  buttonlabel,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: MyColors.textColor,
                )
              ],
            ))
          : Container(
              height: 28,
              child: Center(
                child: Text(
                  buttonlabel,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
      style: TextButton.styleFrom(
          backgroundColor: MyColors.bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(
            color: MyColors.textColor,
            width: 1.6,
          )),
    );
  }
}

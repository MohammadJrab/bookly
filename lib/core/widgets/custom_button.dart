import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.borderRedius,
      this.fontSize});
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRedius;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRedius ??
                BorderRadius.circular(
                  16,
                ),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

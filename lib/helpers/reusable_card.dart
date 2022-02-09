import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget cardDetails;
  final double? elevation;
  final VoidCallback? onPress;
  ReusableCard(
      {Key? key,
        required this.backgroundColor,
        required this.cardDetails,
        this.onPress,
        this.elevation,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
        elevation: elevation ?? 0.toDouble(),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardDetails,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Widget child;
  final Border? borderStyle;
  final Color? boxShadowColor;

  const ReusableCard({
    Key? key,
    required this.child,
    this.boxShadowColor,
    this.borderStyle}) : super(key: key);

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.all(20.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: widget.child,
            decoration: BoxDecoration(
                color: Colors.white,
                border: widget.borderStyle ?? Border.all(
                    color: Colors.black,
                    width: 2),
                boxShadow: [
                  BoxShadow(
                      color: widget.boxShadowColor ?? Colors.black,
                      offset: Offset(10.0,10.0)
                  )
                ]
            ),
          ),
        )
      ],
    );
  }
}
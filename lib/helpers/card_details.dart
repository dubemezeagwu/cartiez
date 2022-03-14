import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/size.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              "assets/images/mastercard_hd.png",
            height: 60,
            width: 90,
          ),
        ),),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Text(
                "Platinum Card",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Text(
              "JONAH MOSS",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom : Constants.defaultPadding * 2.5, left: Constants.defaultPadding),
            child: Text(
              "**** **** **** 5682",
              style: TextStyle(
                  fontSize: 20,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment. bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom : Constants.defaultPadding * 5, left: Constants.defaultPadding),
            child: Container(
              alignment: Alignment.bottomRight,
              width: width / 6,
              height: height / 16,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  boxShadow: Constants.neumorpShadow,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}

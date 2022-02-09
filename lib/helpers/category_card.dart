import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback press;

  CategoryCard(
      {Key? key,
        required this.icon,
        required this.title,
        required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding / 4,
            vertical: defaultPadding /2,
          ),
          child: Column(
            children: [
              SvgPicture.asset(icon),
              SizedBox(height: defaultPadding / 2),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ));
  }
}

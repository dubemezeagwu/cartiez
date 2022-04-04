import 'package:cartiez/utils/size_config.dart';
import 'package:cartiez/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.backgroundColor,
    required this.press,
  }) : super(key: key);

  final String title,image;
  final num price;
  final Color backgroundColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(Constants.defaultPadding),
        decoration: BoxDecoration(
            color: Constants.itemBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(Constants.defaultBorderRadius))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: getProportionateScreenWidth(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(Constants.defaultBorderRadius))
              ),
              child: Image.network(
                image, height: getProportionateScreenHeight(100),
              fit: BoxFit.fill,),
            ),
            Container(
              width: getProportionateScreenWidth(100),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: regular11
              ),
            ),
            Text(
              "\$" + price.toString(),
              style: medium14,
            )
          ],
        ),
      ),
    );
  }
}
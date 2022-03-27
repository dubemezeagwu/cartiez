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
        width: 154,
        padding: EdgeInsets.all(Constants.defaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(Constants.defaultBorderRadius))
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(Constants.defaultBorderRadius))
              ),
              child: Image.network(image, height: 150,),
            ),
            const SizedBox(height: Constants.defaultPadding/2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: title.length > 5 ? TextOverflow.ellipsis : null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: Constants.defaultPadding/4,),
                Text(
                  "\$" + price.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
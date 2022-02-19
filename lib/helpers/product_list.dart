import 'package:cartiez/helpers/product_card.dart';
import 'package:cartiez/routes/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/constants.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:
          List.generate(demoProduct.length, (index) =>
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ProductCard(
                  image: demoProduct[index].image,
                  title: demoProduct[index].title,
                  backgroundColor: demoProduct[index].backgroundColor,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: demoProduct[index],)));
                  },
                  price: demoProduct[index].price,),
              ))
      ),
    );
  }
}
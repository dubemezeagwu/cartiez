import 'package:cartiez/bloc/get_products_bloc.dart';
import 'package:cartiez/presentation/helpers/product_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/product.dart';
import '../../utils/constants.dart';
import '../routes/screens/product_details_screen.dart';


class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    productsBloc.getProducts();
    return StreamBuilder(
        stream: productsBloc.allProducts,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasError) {
            print("Error from data: ${snapshot.error}");
          }
          if (snapshot.hasData) {
            print(snapshot.hasData);
            return buildListView(snapshot);
          }
          return Center(
              child: CircularProgressIndicator()
          );
        });
  }

  Widget buildListView(AsyncSnapshot<List<Product>> snapshot) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  child: ProductCard(
                      image: snapshot.data![index].image,
                      title: snapshot.data![index].title,
                      backgroundColor: Colors.white,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(product:  snapshot.data![index],)));
                      },
                      price: snapshot.data![index].price),
                ));
  }
}
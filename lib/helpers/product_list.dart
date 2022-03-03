import 'package:cartiez/helpers/product_card.dart';
import 'package:cartiez/routes/screens/product_details_screen.dart';
import 'package:cartiez/services/network/api_service.dart';
import 'package:cartiez/utils/size.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/constants.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product>? futureProducts;

  @override
  void initState() {
    super.initState();
    // fetchProducts();

  }

  // void fetchProducts () async{
  //   futureProducts = await ApiService().fetchProducts();
  // }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Product>>(
      future: ApiService.getProducts(),
      builder: (context, snapshot) {
        final products = snapshot.data;
        print("Data 1: ${ApiService.getProducts()}");
        if (snapshot.hasError){
          print("Error from data: ${snapshot.error}");
        }
        if (snapshot.hasData){
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
import 'package:cartiez/helpers/product_card.dart';
import 'package:cartiez/routes/screens/product_details_screen.dart';
import 'package:cartiez/services/network/api_service.dart';
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

  ApiService _apiService = ApiService();


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Product>>(
      future: _apiService.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          print("Error from data: ${snapshot.error}");
        }
        if (snapshot.hasData){
          print("snapshot has data");
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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
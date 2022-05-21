import 'package:cartiez/bloc/get_products_bloc.dart';
import 'package:cartiez/bloc/products/products_bloc.dart';
import 'package:cartiez/presentation/helpers/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state){
          if (state is ProductsLoadingErrorState){
            return Center(child: Text("No Internet Connection"),);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No Internet Connection"),
                  duration: Duration(seconds: 1),
                )
            );
          }
          if (state is ProductsLoadingState) {
            return Center(
              child: Constants.chuckyLoader(),);
          }
          if (state is ProductsLoadedState){
            return buildListView(state.product);
          }
          return Container();
    });
    // productsBloc.getProducts();
    // return StreamBuilder(
    //     stream: productsBloc.allProducts,
    //     builder: (context, AsyncSnapshot<List<Product>> snapshot) {
    //       if (snapshot.hasError) {
    //         print("Error from data: ${snapshot.error}");
    //       }
    //       if (snapshot.hasData) {
    //         print(snapshot.hasData);
    //         return buildListView(snapshot);
    //       }
    //       return Center(
    //           child: Constants.chuckyLoader()
    //       );
    //     });
  }

  Widget buildListView(snapshot) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  child: ProductCard(
                      image: snapshot[index].image,
                      title: snapshot[index].title,
                      backgroundColor: Colors.white,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(product:  snapshot[index],)));
                      },
                      price: snapshot[index].price),
                ));
  }
}
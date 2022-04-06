import 'package:cartiez/bloc/cart/cart_bloc.dart';
import 'package:cartiez/data/models/product.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:cartiez/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
       return Container(
         height: 150,
         margin: EdgeInsets.symmetric(vertical: 4.0),
         padding: EdgeInsets.symmetric(horizontal: 8.0),
         decoration: BoxDecoration(
           color: Constants.itemBackgroundColor,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20),
             topRight: Radius.circular(20),
             bottomLeft: Radius.circular(20),
             bottomRight: Radius.circular(20),
           )
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Container(
               margin: EdgeInsets.all(8.0),
               width: 80.0,
               height: 80.0,
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Center(
                 child: Container(
                   width: 80,
                   height: 80,
                   child: Image.network(widget.product.image),
                 ),
               ),
             ),
             SizedBox(width: 12,),
             Container(
               width: 250,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: 100,
                         child: Text(widget.product.title,style: regular14,),
                       ),
                       Container(
                         width: 30.0,
                         height: 30.0,
                         decoration: BoxDecoration(
                             color: Colors.transparent,
                             borderRadius: BorderRadius.circular(4.0)
                         ),
                         child: InkWell(
                             onTap: (){
                               context.read<CartBloc>().add(CartProductRemoved(product: widget.product));
                             },
                             child: Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 24,)),
                       ),
                     ],
                   ),
                   SizedBox(height: 8),
                   SizedBox(
                     width: 250,
                     child: Row(
                       children: [
                         Container(
                           decoration: BoxDecoration(
                             color: Constants.primaryColor,
                             borderRadius: BorderRadius.circular(4.0)
                           ),
                           child: InkWell(
                             onTap: (){},
                               child: Icon(Icons.remove, color: Colors.black, size: 18,)
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
                           child: Text("1", style: medium20,),
                         ),
                         Container(
                           width: 20.0,
                           height: 20.0,
                           decoration: BoxDecoration(
                               color: Constants.primaryColor,
                               borderRadius: BorderRadius.circular(4.0)
                           ),
                           child: InkWell(
                             onTap: (){},
                               child: Icon(Icons.add, color: Colors.black, size: 18,)),
                         ),
                         Spacer(),
                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           padding: EdgeInsets.all(8),
                           decoration: BoxDecoration(
                               color: Constants.primaryColor,
                               borderRadius: BorderRadius.circular(30)
                           ),
                           child: Text("\$" + widget.product.price.toString(), style: bold11,),
                         )
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(width: 12,),
           ],
         ),
       );
  }
}

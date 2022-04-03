import 'package:cartiez/utils/constants.dart';
import 'package:cartiez/utils/styles.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
       return Container(
         margin: EdgeInsets.symmetric(vertical: 4.0),
         padding: EdgeInsets.symmetric(horizontal: 8.0),
         decoration: BoxDecoration(
           color: Constants.primaryColor,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20),
             topRight: Radius.circular(20),
             bottomLeft: Radius.circular(20),
             bottomRight: Radius.circular(20),
           )
         ),
         child: Row(
           children: [
             Container(
               margin: EdgeInsets.all(8.0),
               width: 80.0,
               height: 80.0,
               decoration: BoxDecoration(
                 color: Colors.orangeAccent,
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Center(
                 child: Container(
                   width: 80,
                   height: 80,
                   child: Image.asset("assets/images/product_0.png"),
                 ),
               ),
             ),
             SizedBox(width: 12,),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: 100,
                         child: Text("Hawaiian Air Trinket Hola Shirt",style: bold14,),
                       ),
                       Container(
                         width: 30.0,
                         height: 30.0,
                         decoration: BoxDecoration(
                             color: Colors.transparent,
                             borderRadius: BorderRadius.circular(4.0)
                         ),
                         child: InkWell(
                             onTap: (){},
                             child: Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 24,)),
                       ),
                     ],
                   ),
                   SizedBox(height: 8),
                   Row(
                     children: [
                       Container(
                         width: 20.0,
                         height: 20.0,
                         decoration: BoxDecoration(
                           color: Colors.grey,
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
                             color: Colors.grey,
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
                             color: Colors.grey,
                             borderRadius: BorderRadius.circular(30)
                         ),
                         child: Text("\$667.99", style: bold11,),
                       )
                     ],
                   )
                 ],
               ),
             ),
             SizedBox(width: 12,),
           ],
         ),
       );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(5),
    //     color: Colors.blueGrey
    //   ),
    //   height: 62,
    //   width: 315,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Image.asset(
    //           "assets/images/product_0.png",
    //         height: 100,
    //         width: 200,
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //         Text("Soft Drink #1"),
    //         Text("2.99"),
    //       ],
    //       ),
    //       Spacer(flex: 6,),
    //       ClipOval(
    //         child: Material(
    //           color: Colors.white, // Button color
    //           child: InkWell(
    //             onTap: () {},
    //             child: SizedBox(width: 30, height: 30, child: Icon(Icons.add)),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text("1"),
    //       ),
    //       ClipOval(
    //         child: Material(
    //           color: Colors.white, // Button color
    //           child: InkWell(
    //             onTap: () {},
    //             child: SizedBox(width: 30, height: 30, child: Icon(Icons.remove)),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

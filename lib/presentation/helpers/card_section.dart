import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import 'card_details.dart';




// Cards section layout.
class CardSection extends StatelessWidget {
  const CardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var width = SizeConfig.screenWidth;
    return Expanded(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: width! / 20),
              alignment: Alignment.centerLeft,
              child: Text("Your Cards", style: TextStyle(
                  color: Colors.black, fontSize:22, fontWeight: FontWeight.bold),)
          ),
          Container(
            height: 300,
            child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Container(
                    width: 320,
                    height: 250,
                    margin: EdgeInsets.symmetric( horizontal: 20, vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                        boxShadow: Constants.neumorpShadow,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            top: -300,
                            bottom: -100,
                            left: -100,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue[900]!.withOpacity(0.2),
                                      blurRadius: 50,
                                      spreadRadius: 2,
                                      offset: Offset(20, 0)),
                                  BoxShadow(
                                      color: Colors.white12,
                                      blurRadius: 0,
                                      spreadRadius: -2,
                                      offset: Offset(0, 0)),
                                ],
                                shape: BoxShape.circle,
                              ),)
                        ),
                        Positioned.fill(
                            top: 150,
                            bottom: -200,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue[900]!.withOpacity(0.2),
                                      blurRadius: 50,
                                      spreadRadius: 2,
                                      offset: Offset(20, 0)),
                                  BoxShadow(
                                      color: Colors.white12,
                                      blurRadius: 0,
                                      spreadRadius: -2,
                                      offset: Offset(0, 0)),
                                ],
                                shape: BoxShape.circle,
                              ),)
                        ),
                        CardDetails()
                      ],
                    ),
                  )),)
        ],
      ),
    );
  }
}

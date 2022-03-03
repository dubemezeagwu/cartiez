import 'package:cartiez/helpers/card_section.dart';
import 'package:cartiez/helpers/reusable_card.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: ReusableCard(
              boxShadowColor: Colors.blueGrey,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: Icon(Icons.person, size: 50,),
                          radius: 50,
                        )),
                    Column(
                      children: [
                        Align (
                          alignment: Alignment.centerRight,
                            child: Text(
                              "Jonah Moss",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            )),
                        Align (
                          alignment: Alignment.centerRight,
                            child: Text(
                              "San Diego, CA",
                              style: TextStyle(),
                            )),
                        // Align (
                        //     alignment: Alignment.topRight,
                        //     child: Text(
                        //       "\$1270",
                        //       style: TextStyle(
                        //         fontSize: 30,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black
                        //       ),
                        //     ))
                      ],
                    ),
                  ],
                )),
          ),
          SizedBox(height: 20,),
          CardSection()
        ],
      ),
    );
  }
}

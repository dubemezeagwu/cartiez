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
                child: Column(
                  children: [
                    Text("Jonah Moss"),
                    Text("San Diego, CA")
                  ],
                )),
          )
        ],
      ),
    );
  }
}

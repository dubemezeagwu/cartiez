import 'package:flutter/material.dart';
class SectionTile extends StatelessWidget {
  final String title;
  final VoidCallback pressSeeAll;
  const SectionTile({
    Key? key,
    required this.title,
    required this.pressSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),),
        TextButton(
          onPressed: pressSeeAll,
          child: Text(
            "See all",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 14
            ),
          ),
        )
      ],
    );
  }
}
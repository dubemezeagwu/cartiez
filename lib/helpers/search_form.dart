import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';
class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "Search...",
            filled: true,
            fillColor: Colors.white,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            prefixIcon: Icon(Icons.search, size: 25,),
            suffixIcon: ElevatedButton(
              onPressed: () {  },
              style: ElevatedButton.styleFrom(
                  primary: Constants.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(Constants.defaultBorderRadius))
                  )
              ),
              child: Icon(Icons.filter_list),
            )
        ),
      ),
    );
  }
}

const outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
        Radius.circular(Constants.defaultBorderRadius)),
    borderSide: BorderSide.none
);
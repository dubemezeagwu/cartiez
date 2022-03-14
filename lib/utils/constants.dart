import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
// App color constants

class Constants{

  static const Color primaryColor = Color(0xFF5262F6);
  static const Color bgColor = Color(0xFFFBFBFD);
  static const Color itemBackgroundColor= Color(0xFFEFEFF2);
  static const Color popupItemBackColor = Color(0xFFDADADB);
  static const Color gradientBackgroundColorEnd = Color(0xFF601A36);
  static const Color gradientBackgroundColorWhite = Color(0xFFFFFFFF);
  static const Color gradientBackgroundColorStart = Color(0xFF4D0F29);

  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;

  static List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5), spreadRadius: -5, offset: Offset(-5, -5), blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900]!.withOpacity(.2),
        spreadRadius: 2,

        offset: Offset(7, 7),
        blurRadius: 20)
  ];

  static Widget chuckyLoader() {
    return Center(
        child: SpinKitFoldingCube(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xFFFFFFFF) : Color(0xFF311433),
          ),
        );
      },
    ));
  }

  static Widget chuckyLoading(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(18), child: Text(message)),
        chuckyLoader(),
      ],
    );
  }

  static void showError(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(message),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

  static dynamic returnApiResponse(http.Response response){

  }
}
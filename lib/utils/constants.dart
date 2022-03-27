import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../data/services/network/network_exception.dart';

// App color constants
class Constants{

  static const Color primaryColor = Color(0xFF5262F6);
  static const Color bgColor = Color(0xFFFBFBFD);
  static const Color itemBackgroundColor= Color(0xFFEFEFF2);
  static const Color popupItemBackColor = Color(0xFFDADADB);
  static const Color gradientBackgroundColorEnd = Color(0xFF545FC7);
  static const Color gradientBackgroundColorWhite = Color(0xFFFFFFFF);
  static const Color gradientBackgroundColorStart = Color(0xFF4654DC);
  static const kDarkColor = Color(0xFF000000);
  static const kBackground = Color(0xFFF4F6FA);
  static const kBlackColor = Color(0xFF1C1F37);
  static const kWhiteColor = Color(0xFFFFFFFF);
  static const kPrimaryColor = Color(0xFF00CDA6);
  static const kRed = Color(0xFFE60606);
  static const kPrimarySwatch = Colors.green;
  static const kGreyColor = Color(0xFF7A7A7A);
  static const kTextFieldColor = Color(0xFFDADADB);
  static const kTextGrey = Color(0xFF8D8F9B);
  static const kGrey2 = Color.fromARGB(255, 223, 221, 221);
  static const kGrey3 = Color(0xFFEAEAEA);
  static const kLightGreen = Color(0xFFC4F3EB);
  static const kMidGreen = Color(0xFF06E4B9);
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
    switch (response.statusCode){
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException( message: response.body.toString());
      case 403:
        throw UnauthorisedException(message: response.body.toString());
      default:
        throw FetchDataException(message: response.body.toString());
    }

  }
}
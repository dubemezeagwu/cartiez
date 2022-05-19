import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../data/services/network/network_exception.dart';

// App color constants
class Constants{

  static const Color primaryColor = Color(0xFF6D90B9);
  static const Color bgColor = Color(0xFFFBFBFD);
  static const Color itemBackgroundColor= Color(0xFFEFEFF2);
  static const Color popupItemBackColor = Color(0xFFDADADB);
  static const Color gradientBackgroundColorEnd = Color(0xFFBBC7DC);
  static const Color gradientBackgroundColorWhite = Color(0xFFFFFFFF);
  static const Color gradientBackgroundColorStart = Color(0xFF6D90B9);
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
            color: index.isEven ? Color(0xFFFFFFFF) : Color(0xFF437180),
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

  // static dynamic returnApiResponse(http.Response response){
  //   switch (response.statusCode){
  //     case 200:
  //       var responseJson = jsonDecode(response.body.toString());
  //       print(responseJson);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException( message: response.body.toString());
  //     case 403:
  //       throw UnauthorisedException(message: response.body.toString());
  //     default:
  //       throw FetchDataException(message: response.body.toString());
  //   }
  //
  // }
}
const String SERVER_DOWN = 'Server Down!';
const String PARSING_ERROR = 'Parsing Error, Try again';
const String DEVELOPER_ERROR = 'Developer Error';
const String SUCCESSFUL = 'Operation Successful';
const String UNKNOWN_USER = 'This user does not exist';
const String LOGGED_OUT_USER = 'Logged out';
const String LOGGED_IN_USER = 'Logged in';
const String EMPTY_FIELD = 'Field Cannot be empty';
const String INCOMPLETE_PASSWORD = 'Password must be more than 8 characters';
const String PASSWORD_CRITERIA_FAILED = 'Password needs to have a number';
const String PASSWORD_DOES_NOT_MATCH = 'Passwords do not match';
const String NEEDS_PASSWORD_CHANGE = 'needs_pwd_change';
const String CREDENTIALS_ARE_WRONG =
    'These credentials are wrong \nCheck and try again';
const int SERVER_OKAY = 200;
const int CREATED = 201;
const int SERVER_MAINTENANCE = 500;
const int POORLY_FORMATTED_REQUEST = 400;
const int WRONG_CREDENTIALS = 401;
const int RESOURCE_NOT_FOUND = 404;
const int REQUEST_CANNOT_BE_PROCESSED = 422;
const int ACCOUNT_ALREADY_EXISTS = 409;
const int REDIRECT = 307;
import 'package:cartiez/services/authentication/authentication_service.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:cartiez/utils/shape/bezier_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _authFirebase = AuthenticationService().auth;
  bool _obscureText = false;
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);
  late TextEditingController _userEmail;
  late TextEditingController _userPassword;
  late TextEditingController _userConfirmPassword;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _userEmail = TextEditingController(text: "");
    _userPassword = TextEditingController( text: "");
    _userConfirmPassword = TextEditingController( text: "");
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _pageKey,
        body: Form(
          key: _formPageKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -MediaQuery.of(context).size.width * .24,
                    top: -MediaQuery.of(context).size.height * .24,
                      child: BezierContainer()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Expanded(
                          flex: 3,
                            child: SizedBox(),
                        ),
                        Text(
                          "CARTIEZ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(height: 50,),
                        _emailPasswordWidget(),
                        SizedBox(height: 20,),
                        _registerButton(),
                        Expanded(
                            child: SizedBox(),
                            flex: 2,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _loginAccountLabel(),
                  ),
                  Positioned(
                    top: 40,
                      left: 0,
                      child: _backButton())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void showErrorScreen (BuildContext context, String message){
    setState(() {
      isLoading = false;
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(message),
            backgroundColor: Constants.popupItemBackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok"))
            ],
          ));
    });
  }

  Widget _registerButton() {
    return isLoading
        ? Center(
            child: Constants.chuckyLoading("Registering new user..."),
    ) : GestureDetector(
      onTap: () {},
      child: Container(
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Constants.gradientBackgroundColorStart,
                  Constants.gradientBackgroundColorEnd
                ]
            ),
        ),
      ),
    );
  }

  // Widget that contains the email and password field widgets
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        SizedBox(
          height: 10,
        ),
        _passwordField(),
        SizedBox(height: 10),
        _confirmPasswordField(),
      ],
    );
  }

  // Email field Widget
  Widget _emailField() {
    return TextFormField(
      key: Key("userEmail"),
      controller: _userEmail,
      validator: (value) => (value!.isEmpty) ? "Please Enter Email" : null,
      style: style,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(Icons.email),
          labelText: "Email",
          border: OutlineInputBorder()),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      key: Key("userPassword"),
      controller: _userPassword,
      obscureText: _obscureText,
      enableInteractiveSelection: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Password" : null,
      style: style,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(Icons.lock),
          suffix: GestureDetector(
            onTap: _togglePassword,
            child: Text(_obscureText ? "Show" : "Hide",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueAccent
            ),
            ),
          ),
          labelText: "Password",
          border: OutlineInputBorder()),
    );
  }

  Widget _confirmPasswordField() {
    return TextFormField(
      key: Key("userConfirmPassword"),
      controller: _userConfirmPassword,
      obscureText: _obscureText,
      enableInteractiveSelection: false,
      validator: (value) => (value!.isEmpty) ? "Password does not match" : null,
      style: style,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(Icons.lock),
          labelText: "Confirm Password",
          border: OutlineInputBorder()),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            Text('Back',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }

}

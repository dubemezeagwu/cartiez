import 'package:cartiez/presentation/helpers/custom_textfield.dart';
import 'package:cartiez/presentation/helpers/navigation_widget.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:cartiez/utils/shape/bezier_container.dart';
import 'package:cartiez/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../data/services/authentication/authentication_service.dart';
import '../../../../utils/size_config.dart';
import 'login_page.dart';

// Register page where the user provides credentials to register on the app.
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
  FocusNode _focusNode = FocusNode();

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
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _pageKey,
        body: Form(
          key: _formPageKey,
          child: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
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
                          ),
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
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()));
      },
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
    return CustomTextField(
      enabled: true,
      title: 'Email',
      textFormKey: Key("userEmail"),
      controller: _userEmail,
      obscureText: false,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Email" : null,
      prefixIcon: Icon(Icons.email),
    );
  }

  Widget _passwordField() {
    return CustomTextField(
      enabled: true,
      title: 'Enter Password',
      textFormKey: Key("userPassword"),
      controller: _userPassword,
      obscureText: _obscureText,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Password does not match" : null,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: GestureDetector(
        onTap: _togglePassword,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(_obscureText ? "Show" : "Hide", style: regular11,),
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return CustomTextField(
      enabled: true,
      title: 'Confirm Password',
      textFormKey: Key("userConfirmPassword"),
      controller: _userConfirmPassword,
      obscureText: _obscureText,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Password does not match" : null,
      prefixIcon: Icon(Icons.lock),

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

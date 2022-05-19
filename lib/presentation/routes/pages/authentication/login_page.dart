import 'package:cartiez/presentation/routes/pages/authentication/register_page.dart';
import 'package:cartiez/utils/shape/bezier_container.dart';
import 'package:cartiez/utils/size_config.dart';
import 'package:cartiez/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../data/services/authentication/authentication_service.dart';
import '../../../../utils/constants.dart';
import '../../../helpers/custom_textfield.dart';



// Login Page where the user logs in back into the app.
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _authFirebase = AuthenticationService().auth;
  bool _obscureText = false;
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);
  late TextEditingController _userEmail;
  late TextEditingController _userPassword;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _userEmail = TextEditingController(text: "");
    _userPassword = TextEditingController( text: "");
  }

  @override
  void dispose() {
    _userEmail.dispose();
    _userPassword.dispose();
    super.dispose();
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                            child: SizedBox()
                        ),
                        Text(
                            "CARTIEZ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        _emailPasswordWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        _loginButton(),
                        _forgotPassword(),
                        SizedBox(
                          height: 20,
                        ),
                        _divider(),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _createAccountLabel(),
                  ),
                  Positioned(
                      top: -MediaQuery.of(context).size.height * .24,
                      left: -MediaQuery.of(context).size.width * .24,
                      child: BezierContainer())
                ],
              ),
            ),
          ),),
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        SizedBox(
          height: 10,
        ),
        _passwordField(),
      ],
    );
  }

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
      title: 'Password',
      textFormKey: Key("userPassword"),
      controller: _userPassword,
      obscureText: _obscureText,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Password" : null,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: GestureDetector(
        onTap: _togglePassword,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(_obscureText ? "Show" : "Hide", style: regular11,),
        ),
      ),

    );
  }

  Widget _loginButton() {
    return isLoading ? Center(
         child: Constants.chuckyLoading("Logging in..."),
    ) : GestureDetector(
      onTap: () {},
      child: Container(
        child: Text(
          'Login',
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
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Constants.gradientBackgroundColorStart,
                  Constants.gradientBackgroundColorEnd
                ]
            )
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () {
        if (_userEmail.text != "") resetPassword(_userEmail.text);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: Text('Forgot Password ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }


  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text(
              'Register',
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

  Future<void> resetPassword(String email) async {
    // await _authFirebase.sendPasswordResetEmail(email: email);
  }
}

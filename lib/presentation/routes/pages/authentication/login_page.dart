import 'package:cartiez/presentation/routes/pages/authentication/register_page.dart';
import 'package:cartiez/utils/shape/bezier_container.dart';
import 'package:flutter/material.dart';
import '../../../../data/services/authentication/authentication_service.dart';
import '../../../../utils/constants.dart';



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
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
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
    return Container(
      child: TextFormField(
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
              child: Text( _obscureText ? "Show" : "Hide",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueAccent
                ),),
            ),
            labelText: "Password",
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget _loginButton() {
    return isLoading ? Center(
         child: Constants.chuckyLoading("Logging in..."),
    ) : GestureDetector(
      onTap: ()  {},
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

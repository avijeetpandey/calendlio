import 'package:calendlio/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // FormState Key for Login Form
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  /**
   * Text Field Controllers 
   */

  TextEditingController _mobileController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: GoogleFonts.acme(fontSize: 25.0, letterSpacing: 1.01),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
          child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                // Mobile Phone Field
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Field can\'t be empty';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    controller: _mobileController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.map),
                        suffixIcon: IconButton(
                          onPressed: () => _mobileController.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        hintText: 'Enter Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        labelText: 'Enter Phone',
                        labelStyle: GoogleFonts.acme(fontSize: 18.0)),
                  ),
                ),

                // Phone Field
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Field can\'t be empty';
                      }
                      return null;
                    },
                    controller: _otpController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mobile_screen_share),
                        suffixIcon: IconButton(
                          onPressed: () => _otpController.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        hintText: 'Enter otp',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        labelText: 'Enter otp',
                        labelStyle: GoogleFonts.acme(fontSize: 18.0)),
                  ),
                ),

                // Buttons For Login and Register Section
                SizedBox(
                  height: 10.0,
                ),
                /** 
                   * Login Raised Button
                   */
                SizedBox(
                  width: 320.0,
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: Colors.purple,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Login',
                        style: GoogleFonts.acme(fontSize: 18.0),
                      ),
                    ),
                    onPressed: () {
                      if (_loginKey.currentState.validate()) {
                        API.login(_mobileController.text, _otpController.text);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Login Succesfull')));
                        Navigator.pushReplacementNamed(context, "/home");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.purple)),
                  ),
                ),

                SizedBox(
                  height: 15.0,
                ),
                /**
                   * Login Button
                   */
                SizedBox(
                  width: 320.0,
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: Colors.purple,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Register Instead ?',
                        style: GoogleFonts.acme(fontSize: 18.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/register");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.purple)),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

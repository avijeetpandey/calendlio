import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * Fields in Register Page of the App
 * 1. Email Address Field
 * 2. First Name Field
 * 3. Last Name Field
 * 4. Address Field
 * 5. PhoneNumber Field
 * Two Raised Buttons For Login and Register 
 * 
 */
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  /**
     * Text Editing Controllers for The form fields
     */

  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  /**
   * Form Keys 
   */

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: GoogleFonts.acme(fontSize: 25.0, letterSpacing: 1.01),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _registerKey,
              child: Column(
                children: [
                  // Email Field
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter something , field can\'t be empty';
                        }
                        return null;
                      },
                      controller: _emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: IconButton(
                            onPressed: () => _emailController.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          labelText: 'Enter email',
                          labelStyle: GoogleFonts.acme(fontSize: 18.0)),
                    ),
                  ),

                  // First Name Field
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          suffixIcon: IconButton(
                            onPressed: () => _firstNameController.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          hintText: 'Enter your first name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          labelText: 'Enter First Name',
                          labelStyle: GoogleFonts.acme(fontSize: 18.0)),
                    ),
                  ),

                  //Last Name Field
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          suffixIcon: IconButton(
                            onPressed: () => _lastNameController.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          hintText: 'Enter your last name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          labelText: 'Enter last Name',
                          labelStyle: GoogleFonts.acme(fontSize: 18.0)),
                    ),
                  ),

                  // Address Field
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _addressController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.map),
                          suffixIcon: IconButton(
                            onPressed: () => _addressController.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          hintText: 'Enter your address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          labelText: 'Enter address',
                          labelStyle: GoogleFonts.acme(fontSize: 18.0)),
                    ),
                  ),

                  // Phone Field
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _phoneController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mobile_screen_share),
                          suffixIcon: IconButton(
                            onPressed: () => _phoneController.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          hintText: 'Enter phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          labelText: 'Enter phone number',
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
                          'Register',
                          style: GoogleFonts.acme(fontSize: 18.0),
                        ),
                      ),
                      onPressed: () {
                        if (_registerKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('User Registered')));
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
                          'Login Instead ?',
                          style: GoogleFonts.acme(fontSize: 18.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
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
        ),
      ),
    );
  }
}

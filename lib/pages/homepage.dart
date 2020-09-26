import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DashBoard",
          style: GoogleFonts.acme(fontSize: 20.0),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
    );
  }
}

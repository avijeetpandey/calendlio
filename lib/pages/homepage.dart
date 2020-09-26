import 'package:calendlio/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String details = '';
  Future meetingDetails;

  @override
  void initState() {
    super.initState();
    var res = API.getAll();
    setState(() {
      meetingDetails = res;
    });
    print(meetingDetails.toString());
  }

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
      body: Text(details),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          Navigator.pushNamed(context, "/create");
        },
      ),
    );
  }
}

import 'package:calendlio/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /**
   * Getter Methods
   */
  String _description(dynamic desc) {
    return desc['description'];
  }

  String getTime(dynamic time) {
    DateTime dateTime = DateTime.parse(time).toLocal();
    return dateTime.toString().substring(0, 16);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      body: Container(
        child: Center(
          child: FutureBuilder<List<dynamic>>(
              future: API.getAll(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/meeting.png'),
                          ),
                          title: Text(
                            'Meeting Name : ' +
                                snapshot.data[index]['description'],
                            style: GoogleFonts.acme(),
                          ),
                          subtitle: Text(
                            'Time : ' +
                                getTime(snapshot.data[index]['start_datetime']),
                            style: GoogleFonts.acme(),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
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

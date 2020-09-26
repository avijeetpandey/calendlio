import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  DateTime selectedDate = DateTime.now();

  TextEditingController _descriptionController = TextEditingController();

  /**
   * 
   * Functions to select date and time from the user
   */

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }

  Future<DateTime> _selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

  void _showDateAndTime(BuildContext context) async {
    final selectedTime = await _selectTime(context);
    if (selectedTime == null) return;
    final selectedDate = await _selectDate(context);
    if (selectedTime == null) return;

    setState(() {
      this.selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meeting Description',
          style: GoogleFonts.acme(fontSize: 25.0, letterSpacing: 1.01),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /**
               * Description Input Field
               */

              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  autofocus: true,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Enter description',
                      hintText: 'Enter description here',
                      prefixIcon: Icon(Icons.description),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _descriptionController.clear(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),
              ),

              /**
               * Raised Button for Date and Time
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Pick Date Button
                  SizedBox(
                    width: 150.0,
                    child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.purple,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Pick Date',
                            style: GoogleFonts.acme(fontSize: 18.0),
                          ),
                        ),
                        onPressed: () => _selectDate(context)),
                  ),

                  // Time Picker
                  SizedBox(
                    width: 150.0,
                    child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.purple,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Pick Time',
                            style: GoogleFonts.acme(fontSize: 18.0),
                          ),
                        ),
                        onPressed: () => _selectTime(context)),
                  )
                ],
              ),

              SizedBox(
                height: 20.0,
              ),

              // Create Meeting Button
              SizedBox(
                width: 350.0,
                child: RaisedButton(
                    color: Colors.white,
                    textColor: Colors.purple,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Create Meeting',
                        style: GoogleFonts.acme(fontSize: 18.0),
                      ),
                    ),
                    onPressed: () => {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

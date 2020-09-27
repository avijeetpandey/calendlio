import 'package:calendlio/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

/**
 * DateTime.now().toUtc().toIso8601String()
 */
class _CreateMeetingState extends State<CreateMeeting> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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

  void _showStartDateAndTime(BuildContext context) async {
    final selectedStartTime = await _selectTime(context);
    if (selectedStartTime == null) return;
    final selectedStartDate = await _selectDate(context);
    if (selectedStartTime == null) return;

    setState(() {
      this.startDate = DateTime(
        selectedStartDate.year,
        selectedStartDate.month,
        selectedStartDate.day,
        selectedStartTime.hour,
        selectedStartTime.minute,
      );
    });
  }

  void _showEndDateAndTime(BuildContext context) async {
    final selectedEndTime = await _selectTime(context);
    if (selectedEndTime == null) return;

    final selectedEndDate = await _selectDate(context);
    if (selectedEndTime == null) return;

    setState(() {
      this.endDate = DateTime(
        selectedEndDate.year,
        selectedEndDate.month,
        selectedEndDate.day,
        selectedEndTime.hour,
        selectedEndTime.minute,
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
                    width: 160.0,
                    child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.purple,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Pick Start Date Time',
                            style: GoogleFonts.acme(fontSize: 18.0),
                          ),
                        ),
                        onPressed: () => _showStartDateAndTime(context)),
                  ),

                  // Time Picker
                  SizedBox(
                    width: 160.0,
                    child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.purple,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Pick End Date Time',
                            style: GoogleFonts.acme(fontSize: 18.0),
                          ),
                        ),
                        onPressed: () => _showEndDateAndTime(context)),
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
                    onPressed: () {
                      API.createMeeting(
                          _descriptionController.text,
                          startDate.toUtc().toIso8601String(),
                          endDate.toUtc().toIso8601String());

                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

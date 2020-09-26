import 'package:calendlio/utils/constants.dart';
import 'package:calendlio/utils/user.dart';
import 'package:calendlio/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  /**
   * Function to Register user and save the Auth token of the user
   */
  static Future<int> register(User user) async {
    var client = http.Client();
    var response = await client.post(Strings.registerUrl, body: {
      "email": user.email,
      "first_name": user.firstName,
      "last_name": user.lastName,
      "address": user.address,
      "phone_number": user.phoneNumber
    });

    var decodedResponse = json.decode(response.body);

    Constants.auth_token.setString("auth_token", decodedResponse["auth_token"]);
    print("Auth Token Saved");
    print(Constants.auth_token.getString("auth_token"));
    return response.statusCode;
  }

  /**
   * Function to Login the user using the otp and mobile with auth token
   */
  static Future<void> login(String mobile, String otp) async {
    var client = http.Client();
    var response = await client.post(Strings.loginUrl, body: {
      "otp": "123456",
      "phone_number": mobile,
      "auth_token": Constants.auth_token.getString("auth_token")
    });

    print(response.body);
  }

  /**
   * Function to fetch the list of all available meetings
   */

  static Future getAll() async {
    List meetingDetails;
    Map data;
    var client = http.Client();
    var response = await client.get(Strings.getAllMeetingsUrl, headers: {
      'Authorization': 'Token ${Constants.auth_token.getString("auth_token")}'
    });

    data = json.decode(response.body);
    meetingDetails = data["results"];

    return meetingDetails;
  }

  /**
   * Function to create a meeting for the user ( user being authenticated)
   */

  /**
   * Function to delete the meeting of the user 
   */

}

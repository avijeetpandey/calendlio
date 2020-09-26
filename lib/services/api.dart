import 'package:calendlio/utils/constants.dart';
import 'package:calendlio/utils/user.dart';
import 'package:calendlio/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    return response.statusCode;
  }

  /**
   * Function to Login the user using the otp and mobile with auth token
   */
  static Future<void> login(String mobile, String otp) async {
    var client = http.Client();
    var response = await client.post(Strings.loginUrl, body: {
      "otp": "123456",
      "phone_number": "+919899339966",
      "auth_token": Strings.demoAuth
    });
  }

  /**
   * Function to create a meeting for the user ( user being authenticated)
   */

  /**
   * Function to delete the meeting of the user 
   */

}

class User {
  String _email;
  String _firstName;
  String _lastName;
  String _address;
  String _phoneNumber;
  bool _isAuthenticated;

  /**
   * Default Constructor to make a user 
   */

  User(String email, String firstName, String lastName, String address,
      String phoneNumber) {
    this._email = email;
    this._firstName = firstName;
    this._lastName = lastName;
    this._address = address;
    this._phoneNumber = phoneNumber;
    this._isAuthenticated = false;
  }

  /**
   * Getter for the user
   */
  String get firstName {
    return this._firstName;
  }

  String get lastName {
    return this._lastName;
  }

  String get email {
    return this._email;
  }

  String get address {
    return this._address;
  }

  bool get isAuthenticated {
    return this._isAuthenticated;
  }

  String get phoneNumber {
    return this._phoneNumber;
  }

  /**
   * Getters for the user
   */

  set user_auth(bool value) {
    this._isAuthenticated = value;
  }
}

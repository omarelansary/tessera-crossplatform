import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String email;
  String? username;
  String? accessToken;
  String? photoUrl;
  String? password;

  UserModel({
    required this.email,
    this.username,
    this.accessToken,
    this.photoUrl,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'accessToken': accessToken,
      'photoUrl': photoUrl,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      username: map['username'] != null ? map['username'] as String : null,
      accessToken:
          map['accessToken'] != null ? map['accessToken'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  factory UserModel.fromGoogleAuth(
      GoogleSignInAccount account, GoogleSignInAuthentication auth) {
    final Map<String, dynamic> userData = <String, dynamic>{
      'username': account.displayName,
      'email': account.email,
      'photoUrl': account.photoUrl,
      'accessToken': auth.accessToken,
      'idToken': auth.idToken,
    };

    return UserModel.fromMap(userData);
  }

  factory UserModel.fromFacebookAuth(userdata, token) {
    print(userdata["name"]);
    //print(userdata['email']);
    //print(userdata['picture']['data']['url']);
    //print(result);
    final Map<String, dynamic> userData = <String, dynamic>{
      'username': userdata["name"],
      'email': userdata['email'],
      'photoUrl': userdata['picture']['data']['url'],
      'accessToken': token,
    };

    return UserModel.fromMap(userData);
  }

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, accessToken: $accessToken, photoUrl: $photoUrl, password: $password)';
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String phoneNumber;
  String profilePicture;
  String emailAddress;
  String? name;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phoneNumber,
      required this.profilePicture,
      required this.emailAddress,
      this.name});

//Convert model to Json structure for storing data in firebase.

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'EmailAddress': emailAddress,
      'Name': '$firstName $lastName'
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['FirstName'],
      lastName: data['LastName'],
      emailAddress: data['EmailAddress'],
      userName: data["UserName"],
      phoneNumber: data["PhoneNumber"],
      profilePicture: data["ProfilePicture"] ?? "",
      name: data['Name'],
    );
  }
}

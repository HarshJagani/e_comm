import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  final String userName;
  final String phoneNumber;
  String profilePicture;
  String emailAddress;
  String? name;

  UserModel(
      { 
      this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phoneNumber,
      required this.profilePicture,
      required this.emailAddress,
      this.name 
      });

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

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      phoneNumber: '',
      profilePicture: '',
      emailAddress: ''
      );

// Facrory method to creat UserModel from a firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        emailAddress: data['EmailAddress'],
        userName: data["UserName"] ?? '',
        phoneNumber: data["PhoneNumber"] ?? '',
        profilePicture: data["ProfilePicture"] ?? "",
        name: data['Name'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String phoneNumber;
  String profilePicture;
  String  emailAddress;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.emailAddress,
});

//Convert model to Json structure for storing data in firebase.

Map<String, dynamic> toJson() {
  return {
    'FirstName' : firstName,
    'LastName': lastName,
    'UserName' : userName,
    'PhoneNumber' : phoneNumber,
    'ProfilePicture' : profilePicture,
    'EmailAddress' : emailAddress
  };
}

}
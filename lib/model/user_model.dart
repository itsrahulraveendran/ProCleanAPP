class UserModel {
  String fullName;
  String eMail;
  String password;

  UserModel(
      {required this.fullName, required this.eMail, required this.password});

  factory UserModel.fromMAp(Map<String, dynamic> map) {
    return UserModel(
        fullName: map['fullname'],
        eMail: map['eMail'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'fullName': fullName,
      'eMail': eMail,
      'password': password,
    };
  }
}

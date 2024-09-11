class UserModel {
  String ZZfullName;
  String eMail;
  String password;

  UserModel(
      {required this.ZZfullName, required this.eMail, required this.password});

  factory UserModel.fromMAp(Map<String, dynamic> map) {
    return UserModel(
        ZZfullName: map['fullname'],
        eMail: map['eMail'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'fullName': ZZfullName,
      'eMail': eMail,
      'password': password,
    };
  }
}

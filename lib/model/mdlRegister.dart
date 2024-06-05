class RegisterModel {
  final String email;
  final String password;
  final dynamic confiramtionpassword;
  final String name;

  RegisterModel(
      {required this.email,
      required this.password,
      required this.confiramtionpassword,
      required this.name});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confiramtionpassword': confiramtionpassword,
      'name': name,
    };
  }
}

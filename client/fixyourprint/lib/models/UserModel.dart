class UserLogin {
  late String email;
  late String password;

  UserLogin({required this.email, required this.password});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(email: json['email'], password: json['password']);
  }
}

class UserCreate {
  late String name;
  late String email;
  late String password;

  UserCreate({required this.name, required this.email, required this.password});
}

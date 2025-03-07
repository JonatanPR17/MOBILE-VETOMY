class User {
  final String name;
  final String lastName;
  final String mail;
  final String password;

  User({
    required this.name,
    required this.lastName,
    required this.mail,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastName: json['lastName'],
      mail: json['mail'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "lastName": lastName,
      "mail": mail,
      "password": password,
    };
  }
}

class LoginResModel {
  final String? token;

  LoginResModel({this.token});

  factory LoginResModel.fromJson(Map<String, dynamic> json) {
    return LoginResModel(
      token: json['token'],
    );
  }
}
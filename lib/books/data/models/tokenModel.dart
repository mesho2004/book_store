class TokenModel {
 final String? token;
 final String? tokenType;

  TokenModel({this.token, this.tokenType});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'],
      tokenType: json['token_type'],
    );
  }
}
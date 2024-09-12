class TokenModel {
  final String? token;
  final String? tokenType;

  TokenModel({this.token, this.tokenType});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token'], tokenType: json['tokenType']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    return data;
  }
}

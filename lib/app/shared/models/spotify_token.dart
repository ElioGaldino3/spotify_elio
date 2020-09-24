import 'dart:convert';

class SpotifyToken {
  final String accessToken;
  final String refreshToken;

  SpotifyToken({this.accessToken, this.refreshToken});

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory SpotifyToken.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SpotifyToken(
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpotifyToken.fromJson(String source) =>
      SpotifyToken.fromMap(json.decode(source));
}

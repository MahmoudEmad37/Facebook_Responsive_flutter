import 'package:facebook_flutter/services/classes/user.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends User {
  UserModel({
    @required String name,
    @required String imageUrl,
  }) : super(name: name, imageUrl: imageUrl);

  factory UserModel.fromjson(Map<String, dynamic> snapshot) {
    return UserModel(
      name: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}

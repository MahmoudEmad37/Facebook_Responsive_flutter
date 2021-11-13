import 'package:meta/meta.dart';
import 'package:facebook_flutter/services/classes/classes.dart';

class StoryModel extends Story {
  StoryModel({
    @required String userName,
    @required String userImageUrl,
    @required String imageUrl,
    bool isViewed,
  }) : super(
    user: User(name: userName,imageUrl: userImageUrl),
    imageUrl: imageUrl,
    isViewed: isViewed,
  );

  factory StoryModel.fromjson(Map<String, dynamic> snapshot) {
    return StoryModel(
        userName: snapshot['userName'],
        userImageUrl: snapshot['userImageUrl'],
        imageUrl: snapshot['imageUrl'],
        isViewed: snapshot['isViewed']);
  }
}

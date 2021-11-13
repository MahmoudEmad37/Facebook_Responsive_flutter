import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:flutter/material.dart';

class PostModel extends Post {
  PostModel({
    @required String userName,
    @required String userImageUrl,
    @required String caption,
    @required String timeAgo,
    @required List<dynamic> imageUrl,
    @required int likes,
    @required int comments,
    @required int shares,
    @required List<dynamic> commentsText,
    @required List<dynamic> usersNames,
    @required List<dynamic> usersImageUrl,
  }) : super(
            user: User(name: userName, imageUrl: userImageUrl),
            caption: caption,
            timeAgo: timeAgo,
            imageUrl: imageUrl,
            likes: likes,
            comments: comments,
            shares: shares,
            commentsText: commentsText,
            usersNames: usersNames,
            usersImageUrl: usersImageUrl);

  factory PostModel.fromjson(Map<String, dynamic> snapshot) {
    List<dynamic> makeList = [];
    if (snapshot['imageUrl'] is String) makeList.add(snapshot['imageUrl']);

    return PostModel(
      userName: snapshot['userName'],
      userImageUrl: snapshot['userImageUrl'],
      caption: snapshot['caption'],
      timeAgo: snapshot['timeAgo'],
      imageUrl:
          snapshot['imageUrl'] is String ? makeList : snapshot['imageUrl'],
      likes: snapshot['likes'],
      comments: snapshot['comments'],
      shares: snapshot['shares'],
      commentsText: snapshot['commentsText'],
      usersNames: snapshot['usersNames'],
      usersImageUrl: snapshot['usersImageUrl'],
    );
  }
}

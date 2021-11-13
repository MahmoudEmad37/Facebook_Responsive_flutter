import 'package:meta/meta.dart';
import 'package:facebook_flutter/services/classes/classes.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final List<dynamic> imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final List<dynamic> commentsText;
  final List<dynamic> usersNames;
  final List<dynamic> usersImageUrl;

  const Post({
    @required this.user,
    @required this.caption,
    @required this.timeAgo,
    @required this.imageUrl,
    @required this.likes,
    @required this.comments,
    @required this.shares,
    @required this.commentsText,
    @required this.usersNames,
    @required this.usersImageUrl,
  });
}

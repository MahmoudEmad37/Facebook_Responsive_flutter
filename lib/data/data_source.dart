import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/data/models/models.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DataSource {
  Future<List<User>> getAllUsers() async {
    final repose=await rootBundle.loadString("assets/users_json.json");
    final data = json.decode(repose) as List<dynamic>;
    return data.map((e) => UserModel.fromjson(e)).toList();
  }


  Future<List<Story>> getAllStories() async {
    final respose = await rootBundle.loadString("assets/stories_json.json");
    final data = json.decode(respose) as List<dynamic>;
    return data.map((e) => StoryModel.fromjson(e)).toList();
  }


  Future<List<Post>> getAllposts() async {

    final respose = await rootBundle.loadString("assets/posts_json.json");
    final data = json.decode(respose) as List<dynamic>;
    return data.map((e) => PostModel.fromjson(e)).toList();
  }

}
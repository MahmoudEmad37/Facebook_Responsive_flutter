import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:flutter/material.dart';
import 'repository.dart';

class GetAllPosts {
  final Repository repository;

  GetAllPosts({
    @required this.repository,
  });

  Future<List<Post>> call() async {
    return await repository.getAllPosts();
  }
}

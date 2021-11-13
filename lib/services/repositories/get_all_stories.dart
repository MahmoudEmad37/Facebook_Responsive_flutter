import 'package:facebook_flutter/services/classes/classes.dart';
import 'repository.dart';
import 'package:flutter/material.dart';

class GetAllStories{
  final Repository repository;

  GetAllStories({@required this.repository,});

  Future<List<Story>> call() async {

    return await repository.getAllStories();
  }
}

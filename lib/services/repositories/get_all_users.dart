import 'package:facebook_flutter/services/classes/classes.dart';
import 'repository.dart';
import 'package:flutter/material.dart';

class GetAllUsers {
  final Repository repository;

  GetAllUsers({
    @required this.repository,
  });

  Future<List<User>> call() async {
    return await repository.getAllUsers();
  }
}

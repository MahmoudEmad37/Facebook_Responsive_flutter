import 'package:facebook_flutter/data/data_source.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:meta/meta.dart';

class Repository{

  final DataSource dataSource;

  Repository({@required this.dataSource,});

  @override
  Future<List<User>> getAllUsers() async =>
      await dataSource.getAllUsers();

  @override
  Future<List<Story>> getAllStories() async =>
      await dataSource.getAllStories();

  @override
  Future<List<Post>> getAllPosts() async =>
      await dataSource.getAllposts();

}
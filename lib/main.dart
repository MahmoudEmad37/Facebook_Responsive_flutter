import 'package:facebook_flutter/config/palette.dart';
import 'package:facebook_flutter/data/data_source.dart';
import 'package:facebook_flutter/interface/bloc/bloc.dart';
import 'package:facebook_flutter/screens/screens.dart';
import 'package:facebook_flutter/services/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DataSource dataSource = DataSource();
    Repository repository = Repository(dataSource: dataSource);
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) {
            GetAllUsers getAllUsers = GetAllUsers(repository: repository);
            return UserCubit(getAllUser: getAllUsers);
          },
        ),
        BlocProvider<StoryCubit>(
          create: (_) {
            GetAllStories getAllStories = GetAllStories(repository: repository);
            return StoryCubit(getAllStory: getAllStories);
          },
        ),
        BlocProvider<PostCubit>(
          create: (_) {
            GetAllPosts getAllPosts = GetAllPosts(repository: repository);
            return PostCubit(getAllPost: getAllPosts);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Facebook UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Palette.scaffold,
        ),
        home: NavScreen(),
      ),
    );
  }
}

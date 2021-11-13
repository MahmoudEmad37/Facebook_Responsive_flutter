import 'dart:async';
import 'package:facebook_flutter/interface/bloc/bloc.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook_flutter/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  List<User> users;
  List<Post> posts;
  User currentUser;

  final List<IconData> _icons = [
    Icons.home,
    MdiIcons.accountGroup,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      BlocProvider.of<UserCubit>(context).getAllUsers();
      BlocProvider.of<PostCubit>(context).getAllPosts();
    });
    _controller = TabController(vsync: this, length: _icons.length);
    _controller.addListener(_TabSelection);
    super.initState();
  }

  _TabSelection() {
    setState(() {
      _selectedIndex = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, UserState) {
            if (UserState is UserLoaded) {
              users = UserState.users;
              currentUser = UserState.users[0];
              return BlocBuilder<PostCubit, PostState>(
                builder: (context, PostState) {
                  if (PostState is PostLoaded) {
                    posts = PostState.posts;
                    return CustomAppBar(
                      selectedIndex: _selectedIndex,
                      controller: _controller,
                      currentUser: currentUser,
                      icons: _icons,
                      users: users,
                      posts: posts,
                    );
                  }
                  return Container();
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

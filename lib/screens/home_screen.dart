import 'dart:async';

import 'package:facebook_flutter/interface/bloc/bloc.dart';
import 'package:facebook_flutter/platforms/mobile/home_mobile_page.dart';
import 'package:facebook_flutter/platforms/web/home_web_page.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final List<User> users;
  final List<Post> posts;

  const HomeScreen({
    Key key,
    @required this.users,
    @required this.posts,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      BlocProvider.of<StoryCubit>(context).getAllStories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocBuilder<StoryCubit, StoryState>(
          builder: (context, storyState) {
            if (storyState is StoryLoaded) {
              return Responsive(
                mobile: HomeMobilePage(
                  users: widget.users,
                  stories: storyState.stories,
                  posts: widget.posts,
                ),
                tablet: HomeMobilePage(
                  users: widget.users,
                  stories: storyState.stories,
                  posts: widget.posts,
                ),
                web: HomeWebPage(
                  users: widget.users,
                  stories: storyState.stories,
                  posts: widget.posts,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

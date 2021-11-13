import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/create_post_container.dart';
import 'package:facebook_flutter/widgets/rooms.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeMobilePage extends StatelessWidget {
  final List<User> users;
  final List<Story> stories;
  final List<Post> posts;

  const HomeMobilePage({
    Key key,
    this.users,
    this.stories,
    this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: users[0],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(
              onlineUsers: users.getRange(1, users.length).toList(),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: users[0],
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(
                post: post,
                currentUser: users[0],
              );
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

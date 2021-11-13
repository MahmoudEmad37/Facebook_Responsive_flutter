import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeWebPage extends StatelessWidget {
  final List<User> users;
  final List<Story> stories;
  final List<Post> posts;

  const HomeWebPage({
    Key key,
    this.users,
    this.stories,
    this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: MoreOptionsList(currentUser: users[0])),
          ),
        ),
         Spacer(),
        Container(width: 600.0,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser : users[0],
                    stories: stories,
                  ),
                ),
              ),
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final Post post = posts[index];
                    final User user = users[0];
                    return PostContainer(
                      post: post,
                      currentUser: user,
                    );
                  },
                  childCount: posts.length,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ContactsList(
                users: users.getRange(1, users.length).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

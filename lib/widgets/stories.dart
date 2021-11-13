import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_flutter/config/palette.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.getDeviceType(context) == DeviceType.Web
          ? Colors.transparent
          : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _AddStoryCard(
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _AddStoryCard extends StatelessWidget {
  final User currentUser;

  const _AddStoryCard({
    Key key,
    this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: currentUser.imageUrl,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: double.infinity,
          width: 100.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.getDeviceType(context) == DeviceType.Web
                ? [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0),
                  ]
                : null,
          ),
        ),
        Positioned(
          bottom: 40.0,
          right: 30.0,
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Colors.black12,
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Palette.facebookBlue,
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Add New Story",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    fontSize: 16.0);
              },
            ),
          ),
        ),
        Positioned(
          bottom: 7.0,
          //left: 8.0,
          right: 20.0,
          child: Text(
            'Create Story',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  final Story story;

  const _StoryCard({
    Key key,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: story.imageUrl,
            height: double.infinity,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 100.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.getDeviceType(context) == DeviceType.Web
                ? [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0),
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: ProfileAvatar(
            imageUrl: story.user.imageUrl,
            hasBorder: !story.isViewed,
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
          child: Text(
            story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

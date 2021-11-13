import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/profile_avatar.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  final User currentUser;

  const PostContainer(
      {Key key, @required this.post, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWeb = Responsive.getDeviceType(context) == DeviceType.Web;
    return Card(
      elevation: isWeb ? 1.0 : 0.0,
      margin:
          EdgeInsets.symmetric(horizontal: isWeb ? 5.0 : 0.0, vertical: 5.0),
      shape: isWeb
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PostHeader(post: post),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(post.caption),
                    post.imageUrl != null
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 6.0,
                          ),
                  ],
                ),
              ),
              post.imageUrl.length != 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: post.imageUrl.length > 1
                          ? ImagesCarousel(imagesList: post.imageUrl)
                          : CachedNetworkImage(
                              imageUrl: post.imageUrl[0],
                            ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: PostBottom(
                  post: post,
                  currentUser: currentUser,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: const Icon(Icons.more_horiz),
            color: Colors.grey,
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'More',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                fontSize: 16.0,
              );
            })
      ],
    );
  }
}

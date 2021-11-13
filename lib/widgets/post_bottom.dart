import 'dart:math';

import 'package:facebook_flutter/config/palette.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostBottom extends StatefulWidget {
  final Post post;
  final User currentUser;

  const PostBottom({
    Key key,
    @required this.post,
    @required this.currentUser,
  }) : super(key: key);

  @override
  _PostBottomState createState() => _PostBottomState();
}

class _PostBottomState extends State<PostBottom> {
  bool isSendIcon = false;
  int commentCount = 0;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.post.commentsText.length == 0
          ? 160.0
          : widget.post.commentsText.length > 1
              ? 280.0
              : 200.0,
      padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
      color: Colors.white,
      child: Column(
        children: [
          _PostStats(
            post: widget.post,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.post.commentsText.length,
              itemBuilder: (context, index) {
                return _CreateComment(
                  commentText: widget.post.commentsText[index],
                  userName: widget.post.usersNames[index],
                  userImageUrl: widget.post.usersImageUrl[index],
                );
              },
            ),
          ),
          _AddNewComment(),
        ],
      ),
    );
  }



  Widget _AddNewComment() {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Row(
        children: [
          ProfileAvatar(
            imageUrl: widget.currentUser.imageUrl,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              height: 40.0,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (val) {
                        setState(() {
                          if (val == "") {
                            isSendIcon = false;
                          } else {
                            isSendIcon = true;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                        hintText: "Write a comment...",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  isSendIcon == false
                      ? Row(
                    children: [
                      Icon(Icons.emoji_emotions_outlined,color: Colors.grey[600],),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(Icons.camera_alt_outlined,color: Colors.grey[600],),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(MdiIcons.gif,color: Colors.grey[600],),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(MdiIcons.stickerEmoji,color: Colors.grey[600],),
                      SizedBox(
                        width: 5.0,
                      ),
                    ],
                  )
                      : Material(
                    color: Colors.grey[200],
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.post.commentsText
                              .add(textEditingController.text);
                          widget.post.usersNames
                              .add(widget.currentUser.name);
                          widget.post.usersImageUrl
                              .add(widget.currentUser.imageUrl);
                          commentCount++;
                          textEditingController.clear();
                          isSendIcon = false;
                        });
                      },
                      child: Icon(
                        Icons.send,
                        size: 20.0,
                        color: Palette.facebookBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              mesg: "Like",
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              mesg: "Comment",
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              mesg: "Share",
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final String mesg;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.mesg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Fluttertoast.showToast(
              msg: mesg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(
                  label,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateComment extends StatelessWidget {
  final String commentText;
  final String userName;
  final String userImageUrl;

  const _CreateComment({
    Key key,
    this.commentText,
    this.userName,
    this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(imageUrl: userImageUrl),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(commentText),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 13.0),
                  child: Row(
                    children: [
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                              msg: "Like",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              fontSize: 16.0,
                            );
                          },
                          child: Text(
                            "Like",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: "Reply",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                fontSize: 16.0,
                              );
                            },
                            child: Text(
                              "Reply",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${rng.nextInt(20) + 1}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Palette.facebookBlue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.thumb_up,
                          size: 10.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


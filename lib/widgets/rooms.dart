import 'package:facebook_flutter/config/palette.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/profile_avatar.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWeb = Responsive.getDeviceType(context) == DeviceType.Web;
    return Card(
      elevation: isWeb ? 1.0 : 0.0,
      margin: EdgeInsets.symmetric(horizontal: isWeb ? 5.0 : 0.0),
      shape: isWeb
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 60.0,
          color: Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 4.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: onlineUsers.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive.getDeviceType(context) == DeviceType.Web
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: Colors.lightBlueAccent, width: 1.0),
            ),
            width: 130.0,
            child: Row(
              children: [
                SizedBox(width: 5.0),
                Icon(
                  Icons.video_call,
                  size: 30.0,
                  color: Colors.purple,
                ),
                SizedBox(width: 5.0),
                TextButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Create Room",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      fontSize: 16.0,
                    );
                  },
                  child: Text(
                    'Create Room',
                    style: TextStyle(
                        color: Palette.facebookBlue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        : OutlineButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Create Room",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                fontSize: 16.0,
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            borderSide: BorderSide(
              width: 3.0,
              color: Colors.blueAccent[100],
            ),
            textColor: Palette.facebookBlue,
            child: Row(
              children: [
                ShaderMask(
                  shaderCallback: (rect) =>
                      Palette.createRoomGradient.createShader(rect),
                  child: Icon(
                    Icons.video_call,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text('Create\nRoom'),
              ],
            ),
          );
  }
}

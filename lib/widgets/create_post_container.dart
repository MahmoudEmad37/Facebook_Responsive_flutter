import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
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
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(
                    imageUrl: currentUser.imageUrl,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: Container(
                    height: 35.0,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          hintText: 'What\'s on your mind?'),
                    ),
                  ))
                ],
              ),
              const Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              Container(
                height: 35.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton.icon(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Live",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                      },
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live'),
                    ),
                    const VerticalDivider(
                      width: 8.0,
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: isWeb ? 'Photo/Video' : 'Photo',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                      },
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text(isWeb ? 'Photo/Video' : 'Photo'),
                    ),
                    const VerticalDivider(
                      width: 8.0,
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: isWeb ? 'Feeling/Activity' : 'Room',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                      },
                      icon: Icon(
                        isWeb ? Icons.tag_faces : Icons.video_call,
                        color: isWeb ? Colors.yellow : Colors.purpleAccent,
                      ),
                      label: Text(isWeb ? 'Feeling/Activity' : 'Room'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

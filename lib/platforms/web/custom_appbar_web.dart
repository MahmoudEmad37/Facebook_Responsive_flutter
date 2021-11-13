import 'package:facebook_flutter/config/palette.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBarWeb extends StatelessWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;
  final User currentUser;

  const CustomAppBarWeb({
    Key key,
    this.controller,
    this.icons,
    this.selectedIndex,
    this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 4.0,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Icon(
                  MdiIcons.facebook,
                  size: 50.0,
                  color: Palette.facebookBlue,
                )),
                SizedBox(
                  width: 6.0,
                ),
                Flexible(
                    child: Container(
                  width: 400.0,
                  height: 45.0,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        hintText: "Search Facebook",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        )),
                  ),
                ))
              ],
            ),
          ),
          Container(
              height: double.infinity,
              width: 500.0,
              child: CustomAppBarMobile(
                icons: icons,
                selectedIndex: selectedIndex,
                //onTap: onTap,
                controller: controller,
              ),
            ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Current User",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    fontSize: 16.0,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileAvatar(imageUrl: currentUser.imageUrl),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "Mahmoud",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Flexible(
                child: CircleButton(
                  iconData: MdiIcons.dotsGrid,
                  iconSize: 30.0,
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Facebook Menu",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      fontSize: 16.0,
                    );
                  },
                ),
              ),
              Flexible(
                child: CircleButton(
                  iconData: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Facebook Messenger",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      fontSize: 16.0,
                    );
                  },
                ),
              ),
              Flexible(
                  child: CircleButton(
                iconData: Icons.notifications,
                iconSize: 30.0,
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Facebook Notifications",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    fontSize: 16.0,
                  );
                },
              )),
              Flexible(
                  child: CircleButton(
                iconData: Icons.arrow_drop_down,
                iconSize: 30.0,
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Facebook Account",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    fontSize: 16.0,
                  );
                },
              )),
            ],
          ))
        ],
      ),
    );
  }
}

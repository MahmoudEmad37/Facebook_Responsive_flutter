import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:facebook_flutter/config/palette.dart';
import 'package:facebook_flutter/screens/home_screen.dart';
import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:facebook_flutter/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatefulWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;
  final User currentUser;
  final List<User> users;
  final List<Post> posts;

  const CustomAppBar({
    Key key,
    this.controller,
    this.icons,
    this.selectedIndex,
    this.currentUser,
    this.users,
    this.posts,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final List<Widget> screens;

  _CustomAppBarState({this.screens});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScroll) => [
        Responsive.getDeviceType(context) == DeviceType.Mobile ||
                Responsive.getDeviceType(context) == DeviceType.Tablet
            ? CallMobileAppBar(
                controller: widget.controller,
                selectedIndex: widget.selectedIndex,
                icons: widget.icons,
              )
            : CallWebAppBar(
                icons: widget.icons,
                selectedIndex: widget.selectedIndex,
                controller: widget.controller,
                currentUser: widget.currentUser),
      ],
      body: TabBarView(
        controller: widget.controller,
        children: [
          HomeScreen(users: widget.users, posts: widget.posts),
          Scaffold(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
    );
  }
}

class CallMobileAppBar extends StatelessWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;

  const CallMobileAppBar({
    Key key,
    this.controller,
    this.icons,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: DefaultTextStyle(
        style: const TextStyle(
          color: Palette.facebookBlue,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
        child: Container(
          width: 110.0,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              WavyAnimatedText('facebook',
                  textStyle: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  )),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: "Facebook",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                fontSize: 16.0,
              );
            },
          ),
        ),
      ),
      centerTitle: false,
      pinned: true,
      snap: true,
      floating: true,
      actions: [
        CircleButton(
          iconData: Icons.search,
          iconSize: 30.0,
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Search",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
          },
        ),
        CircleButton(
            iconData: MdiIcons.facebookMessenger,
            iconSize: 30.0,
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Messenger",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                fontSize: 16.0,
              );
            }),
      ],
      bottom: PreferredSize(
        preferredSize:
            Size(mediaQueryData.size.width, mediaQueryData.size.height / 15),
        child: CustomAppBarMobile(
          icons: icons,
          selectedIndex: selectedIndex,
          controller: controller,
          //onTap: (index) => setState(() => _selectedIndex = index)
        ),
      ),
    );
  }
}

class CallWebAppBar extends StatelessWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;
  final User currentUser;

  const CallWebAppBar({
    Key key,
    this.controller,
    this.icons,
    this.selectedIndex,
    this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: Size(mediaQueryData.size.width, 9),
        child: CustomAppBarWeb(
          currentUser: currentUser,
          icons: icons,
          selectedIndex: selectedIndex,
          controller: controller,
        ),
      ),
    );
  }
}

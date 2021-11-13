import 'package:facebook_flutter/config/palette.dart';
import 'package:flutter/material.dart';

class CustomAppBarMobile extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final TabController controller;

  const CustomAppBarMobile({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorPadding: EdgeInsets.zero,
      indicatorColor: Palette.facebookBlue,
      indicatorWeight: 3.0,
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

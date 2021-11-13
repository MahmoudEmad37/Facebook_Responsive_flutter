import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const Responsive({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.web,
  }) : super(key: key);

  static DeviceType getDeviceType(BuildContext context) {
    var mediaQueryData=MediaQuery.of(context);
    Orientation orientation = mediaQueryData.orientation;
    double width = 0;
    if (orientation == Orientation.landscape) {
      width = mediaQueryData.size.width;
    } else {
      width = mediaQueryData.size.width;
    }
    if (width >= 950) {
      return DeviceType.Web;
    }
    if (width >= 600) {
      return DeviceType.Tablet;
    }
    return DeviceType.Mobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contex,constraines) {
        if (getDeviceType(context) == DeviceType.Web) {
          return web;
        } else if (getDeviceType(context) == DeviceType.Tablet) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}


enum DeviceType {
  Mobile,
  Tablet,
  Web,
}
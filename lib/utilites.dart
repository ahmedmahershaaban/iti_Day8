import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  // print(url);
  //await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

void pushNav(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popNav(BuildContext context) {
  Navigator.pop(context);
}

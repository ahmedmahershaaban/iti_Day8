import 'package:flutter/material.dart';
import 'package:iti_demo_http_deo/model/user.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../utilites.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({
    Key? key,
    required this.users,
  }) : super(key: key);
  final User users;
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  // void _launchURL(String url) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user Info"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(height: 8),
                Text("Name: ${widget.users.name}"),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    launchURL("tel:${widget.users.phone}");
                  },
                  child: Text("Phone: ${widget.users.phone}"),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    launchURL("mailto:${widget.users.email}");
                  },
                  child: Text("Email: ${widget.users.email}"),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    launchURL("http://${widget.users.website}");
                  },
                  child: Text("Website: ${widget.users.website}"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

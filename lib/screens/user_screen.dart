import 'package:flutter/material.dart';
import 'package:iti_demo_http_deo/model/user.dart';
import 'package:iti_demo_http_deo/screens/posts_screen.dart';
import 'package:iti_demo_http_deo/screens/user_info.dart';
import 'package:iti_demo_http_deo/services/user_service.dart';
import 'package:iti_demo_http_deo/utilites.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool loading = true;
  List<User> usersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsersInScreen();
  }

  void getUsersInScreen() async {
    usersList = await UserService().getUsers();
    setState(() {
      loading = false;
    });
    print(usersList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          GestureDetector(
            onTap: () {
              pushNav(context, PostsScreen());
            },
            child: Icon(Icons.description),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      pushNav(
                        context,
                        UserInfo(users: usersList[index]),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.yellow,
                      ),
                      child: Column(
                        children: [
                          Text("${usersList[index].name}"),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}

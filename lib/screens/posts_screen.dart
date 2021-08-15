import 'package:flutter/material.dart';
import 'package:iti_demo_http_deo/model/posts.dart';
import 'package:iti_demo_http_deo/services/user_service.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  bool loading = true;
  List<Posts> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPosts();
  }

  void getAllPosts() async {
    posts = await UserService().getPosts();
    loading = false;
    setState(() {});
    print(posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("posts"),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text("${posts[index].title}"),
                      SizedBox(height: 5),
                      Text("${posts[index].id}"),
                      SizedBox(height: 10),
                      Text("${posts[index].body}"),
                    ],
                  ),
                );
              }),
    );
  }
}

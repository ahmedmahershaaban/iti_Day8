import 'package:dio/dio.dart';
import 'package:iti_demo_http_deo/model/posts.dart';
import 'package:iti_demo_http_deo/model/user.dart';

class UserService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String user = "users/";
  String postsN = "posts/";

  Future<List<User>> getUsers() async {
    List<User> users = [];
    Response response = await Dio().get("$baseUrl$user");
    var data = response.data;
    for (var user in data) {
      users.add(User.fromJson(user));
    }
    return users;
  }

  Future<List<Posts>> getPosts() async {
    List<Posts> posts = [];
    print("$baseUrl$posts");
    Response response = await Dio().get("$baseUrl$postsN");
    var data = response.data;
    for (var post in data) {
      posts.add(Posts.fromJson(post));
    }
    return posts;
  }
}

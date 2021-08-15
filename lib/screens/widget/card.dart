import 'package:flutter/material.dart';
import 'package:iti_demo_http_deo/model/user.dart';

class Card extends StatelessWidget {
  const Card({
    Key? key,
    @required this.user,
    @required this.press,
  }) : super(key: key);

  final User? user;
  final GestureTapCallback? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.yellow,
          ),
          child: Column(
            children: [
              Text("${user!.name}"),
            ],
          ),
        ),
      ),
    );
  }
}

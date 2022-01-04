import 'package:flutter/material.dart';
import '../screens/detail_Screen.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String details;
  final String videoUrl;
  final String gif;
  TaskWidget(this.title, this.details, this.videoUrl, this.gif);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(TaskDetailScreen.routeName, arguments: {
          'title': title,
          'details': details,
          'videoUrl': videoUrl,
          'gif': gif
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.accessibility_sharp,
              color: Colors.yellow[500],
            ),
            Spacer(),
            Text(title, style: Theme.of(context).textTheme.bodyText1),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Colors.yellow[500],
            ),
          ],
        ),
      ),
    );
  }
}

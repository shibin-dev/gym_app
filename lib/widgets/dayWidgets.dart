import 'package:flutter/material.dart';
import '../providers/model.dart';
import 'package:workout_app/screens/task_screen.dart';

class DayWidget extends StatelessWidget {
  final String title;
  final List<Exercise> exercise;
  DayWidget(this.title, this.exercise);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(TaskScreen.routeName,
            arguments: {'task': exercise, 'title': title});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Icon(
                Icons.calendar_today,
                size: 40,
                color: Colors.yellow[500],
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

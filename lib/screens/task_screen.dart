import 'package:flutter/material.dart';
import '../widgets/task_widgets.dart';

class TaskScreen extends StatelessWidget {
  static const routeName = 'taskscreen';
  @override
  Widget build(BuildContext context) {
    //final exercise = Provider.of<Data>(context).exercises;
    final exercisesList = ModalRoute.of(context).settings.arguments as Map;
    final exercises = exercisesList['task'];
    return Scaffold(
      //backgroundColor: Colors.yellow[500],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('${exercisesList['title']} workouts'),
        backgroundColor: Colors.black,
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/dayscreen.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (ctx, i) => TaskWidget(
                      exercises[i].title,
                      exercises[i].details,
                      exercises[i].videoUrl,
                      exercises[i].gif,
                    ))),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage(this.activity);

  final Map activity;

  List<Widget> _buildSetActivity(List setactivities) {
    List<Widget> setactivieswidget = [];

    for (var exer in setactivities) {
      setactivieswidget.add(ListTile(
        title: Text(exer, style: TextStyle(fontSize: 22),),
      ));
    }
    return setactivieswidget;
  }

  @override
  Widget build(BuildContext context) {
    print(activity.values.toList());
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Page'), // Change to the day clicked
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return StickyHeader(
            header: Container(
              height: 50.0,
              color: Colors.blue[200],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Set ${activity.keys.toList()[index]}",
                style: TextStyle(fontSize: 26),
              ),
            ),
            content: Column(
                children: _buildSetActivity(
                    activity.values.toList()[index]))
          );
        },
        itemCount: activity.length,
      ),
    );
  }
}

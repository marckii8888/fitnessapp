import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './activitypage.dart';
import './biopage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fitness App', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fitness App'),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('clients').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            // print(snapshot.data.documents[0]['days']);
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          },
        ));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ExpansionTile(
      title: Text(document['name']),
      children: _buildChild(document['days'], document['bio'], context),
    );
  }

  List<Widget> _buildChild(days, bio, context) {
    // print(days.keys.toList());
    List children = <Widget>[];
    children.add(ListTile(
      title: Text('Bio'),
      onTap: () {
        // print(bio.keys.toList()[1]);
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return BioPage(bio);
        }));
      },
    ));
    days.forEach((key, value) {
      children.add(ListTile(
          title: Text("Day ${key}"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return ActivityPage(value);
            }));
          }));
    });
    return children;
  }
}

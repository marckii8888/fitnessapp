import 'package:flutter/material.dart';

class BioPage extends StatelessWidget {
  const BioPage(this.bio);

  final Map bio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bio"),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
            _buildBio(bio.keys.toList()[index], bio.values.toList()[index])
          ,
          itemCount: bio.length,
        ));
  }

  Widget _buildBio(attr, value) {
    return ListTile(
      title: Text("${attr} : ${value}"),
    );
  }
}

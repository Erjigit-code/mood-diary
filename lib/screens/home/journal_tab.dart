import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Journal Entries'),
        ),
        body: Center(child: Text('No entries yet.')));
  }
}

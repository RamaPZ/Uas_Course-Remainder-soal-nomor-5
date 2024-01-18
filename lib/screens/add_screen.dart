import 'package:flutter/material.dart';
import 'package:remainder_uas/utils/add_matkul.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Course Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddMatkulForm(),
      ),
    );
  }
}
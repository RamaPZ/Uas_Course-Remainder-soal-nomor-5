import 'package:flutter/material.dart';
import 'package:remainder_uas/model/matkul.dart';
import 'package:remainder_uas/utils/update_matkul.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  final Matkul matkul;
  const UpdateScreen({
    required this.index,
    required this.matkul,
  });
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdateMatkulForm(
          index: widget.index,
          matkul: widget.matkul,
        ),
      ),
    );
  }
}
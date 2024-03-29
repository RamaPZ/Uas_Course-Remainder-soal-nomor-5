import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remainder_uas/screens/update_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:remainder_uas/screens/add_screen.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() =>
      _InfoScreenState();
}

class _InfoScreenState extends
State<InfoScreen> {
  late final Box matkulBox;

  _deleteInfo(int index) {
    matkulBox.deleteAt(index);
    print('Item deleted from box at index:$index');
  }
  @override
  void initState() {
    super.initState();
// Get reference to an already opened box
    matkulBox = Hive.box('matkulBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Remainder'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ),
            ),
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: matkulBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var matkulData =
                currentBox.getAt(index)!;

                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(
                        index: index,
                        matkul: matkulData,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                        matkulData.name,
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          matkulData.kode,
                        ),
                        Text(
                          matkulData.jadwal,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () => _deleteInfo(index),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
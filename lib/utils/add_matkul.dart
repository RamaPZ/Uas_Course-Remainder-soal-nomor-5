import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remainder_uas/model/matkul.dart';

class AddMatkulForm extends StatefulWidget {
  const AddMatkulForm({Key? key}) : super(key: key);
  @override
  _AddMatkulFormState createState() =>
      _AddMatkulFormState();
}

class _AddMatkulFormState extends
State<AddMatkulForm> {
  final _nameController = TextEditingController();
  final _kodeController = TextEditingController();
  final _jadwalController = TextEditingController();
  final _matkulFormKey = GlobalKey<FormState>();
  late final Box box;
  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }
  // Add info to people box
  _addInfo() async {
    Matkul newMatkul = Matkul(
      name: _nameController.text,
      kode: _kodeController.text,
      jadwal: _jadwalController.text,
    );
    box.add(newMatkul);
    print('Info added to box!');
  }

  @override
  void initState() {
    super.initState();
// Get reference to an already opened box
    box = Hive.box('matkulBox');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _matkulFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama Mata Kuliah'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Kode Mata Kuliah'),
          TextFormField(
            controller: _kodeController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Jadwal Mata Kuliah'),
          TextFormField(
            controller: _jadwalController,
            validator: _fieldValidator,
          ),
          Spacer(),
          Padding(
            padding: const
            EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if
                  (_matkulFormKey.currentState!.validate()) {
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
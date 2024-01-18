import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remainder_uas/model/matkul.dart';

class UpdateMatkulForm extends StatefulWidget {
  final int index;
  final Matkul matkul;
  const UpdateMatkulForm({
    required this.index,
    required this.matkul,
  });
  @override
  _UpdateMatkulFormState createState() =>
      _UpdateMatkulFormState();
}
class _UpdateMatkulFormState extends State<UpdateMatkulForm>
{
  final _matkulFormKey = GlobalKey<FormState>();
  late final _nameController;
  late final _kodeController;
  late final _jadwalController;
  late final Box box;
  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

// Update info of people box
  _updateInfo() {
    Matkul newMatkul = Matkul(
      name: _nameController.text,
      kode: _kodeController.text,
      jadwal: _jadwalController.text,
    );
    box.putAt(widget.index, newMatkul);
    print('Info updated in box!');
  }
  @override
  void initState() {
    super.initState();
// Get reference to an already opened box
    box = Hive.box('matkulBox');
    _nameController = TextEditingController(text:
    widget.matkul.name);
    _kodeController = TextEditingController(text:
    widget.matkul.kode);
    _jadwalController = TextEditingController(text:
    widget.matkul.jadwal);
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _matkulFormKey,
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
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
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
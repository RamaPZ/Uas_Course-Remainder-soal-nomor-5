import 'package:hive/hive.dart';

part 'matkul.g.dart';

@HiveType(typeId: 1)
class Matkul {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String kode;

  @HiveField(2)
  final String jadwal;

  Matkul({
    required this.name,
    required this.kode,
    required this.jadwal,
  });
}
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? note;

  @HiveField(2)
  DateTime? date;

  @HiveField(3)
  bool? done;

  Task({this.title, this.note, this.date, this.done});

  void save() {}
}

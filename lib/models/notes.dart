import "package:isar/isar.dart";

// This is needed to generate file
// then run: dart run build_runner build
part 'notes.g.dart';
@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}

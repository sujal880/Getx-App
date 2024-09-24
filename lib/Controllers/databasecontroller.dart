import 'package:get/get.dart';
import 'package:wslc_302_getx/Database/dbhelper.dart';
import 'package:wslc_302_getx/Models/notesmodel.dart';

class DatabaseController extends GetxController {
  final DbHelper dbHelper = Get.put(DbHelper());
  var notes = <NotesModel>[].obs;
  Future<void> addnotes(NotesModel notemodel) async {
    await dbHelper.addNotes(notemodel);
    notes.add(notemodel);
  }

  Future<void> fetchnotes() async {
    await dbHelper.initDb();
    notes.assignAll(await dbHelper.getNotes());
  }
}

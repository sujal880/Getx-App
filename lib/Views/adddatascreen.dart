import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wslc_302_getx/Controllers/databasecontroller.dart';
import 'package:wslc_302_getx/Models/notesmodel.dart';
import 'package:wslc_302_getx/Views/Widgets/uihelper.dart';

class AddDataScreen extends StatelessWidget {
  final DatabaseController databaseController = Get.put(DatabaseController());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController, "Enter Title", Icons.title),
          UiHelper.CustomTextField(
              descController, "Enter Description", Icons.description),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                addData(titleController.text.toString(),
                    descController.text.toString(), context);
              },
              child: Text("Add"))
        ],
      ),
    );
  }

  addData(String title, String desc, BuildContext context) {
    if (title == "" || desc == "") {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter Required Field's")));
    } else {
      final newnote = NotesModel(title: title, desc: desc);
      databaseController.addnotes(newnote);
      Get.back();
    }
  }
}

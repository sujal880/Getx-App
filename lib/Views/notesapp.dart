import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wslc_302_getx/Controllers/databasecontroller.dart';
import 'package:wslc_302_getx/Views/adddatascreen.dart';

class NotesApp extends StatelessWidget {
  final DatabaseController databaseController = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text(databaseController.notes[index].title),
              subtitle: Text(databaseController.notes[index].desc),
            );
          },
          itemCount: databaseController.notes.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());

          // Get.to(AddDataScreen()); // Navigator.push
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

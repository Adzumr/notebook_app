import 'package:flutter/material.dart';
import 'package:notebook/screens/home_screen.dart';
import 'package:notebook/widgets/toast.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class AddNoteScreen extends StatefulWidget {
  static const String idScreen = "addScreen";
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

bool isLoading = false;
final titleController = TextEditingController();
final contentController = TextEditingController();

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: appStyles.titleFont.copyWith(color: appColors.whiteColor),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: appColors.blueColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: titleController,
                  style: appStyles.titleFont,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: contentController,
                  style: appStyles.bodyFont,
                  maxLines: 28,
                  decoration: InputDecoration(
                    hintText: "content",
                    filled: true,
                    fillColor: appColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await api
              .addNote(
            title: titleController.text.trim(),
            content: contentController.text.trim(),
            context: context,
          )
              .then((value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.idScreen,
              (route) => false,
            );
            showToast(
              "Note Saved",
              context,
            );
          });
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.save),
      ),
    );
  }
}

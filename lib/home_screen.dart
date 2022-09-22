import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notebook/main.dart';
import 'package:notebook/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = "homeScree";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Notes",
            style: appStyles.titleFont.copyWith(color: appColors.whiteColor),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: appColors.blueColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: StreamBuilder(
              stream: api.collectionReference.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.docs.isEmpty
                      ? const EmptyNoteWidget()
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return NoteTitle(
                              documentSnapshot: documentSnapshot,
                            );
                          },
                        );
                } else {
                  return const Text("No data");
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showToast(
              "Note Added",
              context,
            );
          },
          tooltip: 'Add Note',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class EmptyNoteWidget extends StatelessWidget {
  const EmptyNoteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Your First Note",
            style: appStyles.titleFont,
          ),
          SizedBox(height: 1.h),
          Text(
            "Add a note about anything "
            "(your thoughts on climate change, "
            "or your history essay) and "
            "share it witht the world",
            textAlign: TextAlign.center,
            style: appStyles.smallBodyFont,
          ),
        ],
      ),
    );
  }
}

class NoteTitle extends StatelessWidget {
  const NoteTitle({
    this.documentSnapshot,
    Key? key,
  }) : super(key: key);
  final DocumentSnapshot? documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(documentSnapshot!["title"]),
      subtitle: Text(documentSnapshot!["content"]),
    );
  }
}

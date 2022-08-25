import 'dart:js';

import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                      hintText: "Title", prefixIcon: Icon(Icons.title)),
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      hintText: "Add Note", prefixIcon: Icon(Icons.add)),
                ),
                Row(
                  children: [
                    const Text("Add Photo"),
                    IconButton(
                        onPressed: () {
                          showBottomSheet();
                        },
                        icon: const Icon(Icons.attach_file)),
                  ],
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Add Note")))
              ],
            ))
          ],
        )),
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            height: 170.0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text("Plaease Choose Image"),
                  const Text("From Gallery"),
                  const Text("From Camera")
                ]),
          );
        });
  }
}

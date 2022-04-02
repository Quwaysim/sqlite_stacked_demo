import 'package:flutter/material.dart';
import 'package:sqlite_stacked_demo/views/ui/add_note/add_note_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNoteViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Note'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => model.noteTitle = value,
                decoration: const InputDecoration(
                  labelText: 'Note Title',
                ),
              ),
              TextField(
                onChanged: (value) => model.noteContent = value,
                decoration: const InputDecoration(
                  labelText: 'Note Content',
                ),
              ),
              ElevatedButton(
                onPressed: () => model.saveNote(),
                child: const Text('Save Note'),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddNoteViewModel(),
    );
  }
}

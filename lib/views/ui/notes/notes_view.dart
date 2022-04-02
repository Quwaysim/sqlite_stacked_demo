import 'package:flutter/material.dart';
import 'package:sqlite_stacked_demo/views/ui/notes/notes_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotesViewModel>.reactive(
      viewModelBuilder: () => NotesViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Notes'),
              IconButton(
                onPressed: model.navigateToAddNotesView,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: model.notesData == ''
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Fetching notes...'),
                )
              : model.notesData.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No notes available'),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: model.notesData != null
                            ? model.notesData.length
                            : 0,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            model.notesData[index].title,
                          ),
                          subtitle: Text(
                            model.notesData[index].content,
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

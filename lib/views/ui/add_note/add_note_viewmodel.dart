import 'package:sqlite_stacked_demo/app/app.locator.dart';
import 'package:sqlite_stacked_demo/models/note.dart';
import 'package:sqlite_stacked_demo/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddNoteViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _snackBarService = locator<SnackbarService>();
  String? noteTitle;
  String? noteContent;

  saveNote() async {
    if (noteTitle == null || noteContent == null) {
      _snackBarService.showSnackbar(
        message: 'Both note title and content are required',
      );
      return;
    }
    Note note = Note(
      title: noteTitle!,
      content: noteContent!,
    );
    await _databaseService.createNote(note);
    _navigationService.back();
  }
}

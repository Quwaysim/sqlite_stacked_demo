import 'package:sqlite_stacked_demo/app/app.locator.dart';
import 'package:sqlite_stacked_demo/app/app.router.dart';
import 'package:sqlite_stacked_demo/models/note.dart';
import 'package:sqlite_stacked_demo/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotesViewModel extends StreamViewModel<List<Note>> {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  List<Note> notes = [];

  init() async {
    notes = await _databaseService.readAllNotes();
  }

  Stream<List<Note>> readAllNotes() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1500));
      yield await _databaseService.readAllNotes();
    }
  }

  @override
  Stream<List<Note>> get stream => readAllNotes();

  dynamic get notesData => data ?? '';

  navigateToAddNotesView() =>
      _navigationService.navigateTo(Routes.saveNoteView);
}

import 'package:sqlite_stacked_demo/services/database_service.dart';
import 'package:sqlite_stacked_demo/views/ui/add_note/add_note_view.dart';
import 'package:sqlite_stacked_demo/views/ui/notes/notes_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: NotesView, initial: true),
    MaterialRoute(page: AddNoteView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    Presolve(
      classType: DatabaseService,
      presolveUsing: DatabaseService.getInstance,
    ),
  ],
)
class App {}

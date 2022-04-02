// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:sqlite_stacked_demo/views/ui/add_note/add_note_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/ui/notes/notes_view.dart';

class Routes {
  static const String notesView = '/';
  static const String saveNoteView = '/save-note-view';
  static const all = <String>{
    notesView,
    saveNoteView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.notesView, page: NotesView),
    RouteDef(Routes.saveNoteView, page: AddNoteView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    NotesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NotesView(),
        settings: data,
      );
    },
    AddNoteView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddNoteView(),
        settings: data,
      );
    },
  };
}

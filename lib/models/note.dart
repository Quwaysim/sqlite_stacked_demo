//table name in db
const String tableNotes = 'notes';

//for db column names
class NoteFields {
  static final List<String> values = [
    id,
    title,
    content,
  ];
  static const String id = '_id';
  static const String title = 'title';
  static const String content = 'content';
}

class Note {
  Note({
    required this.title,
    required this.content,
  });
  late final String title;
  late final String content;

  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['content'] = content;
    return _data;
  }
}

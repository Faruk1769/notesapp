// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:frontend/models/notes.dart';
import 'package:frontend/services/api_services.dart';

class NotesProvider with ChangeNotifier {
  bool isLoading = true;
  List<Note> notes = [];

  NotesProvider() {
    fetchNotes();
  }
  List<Note> getFilteredNotes(String searchQuery) {
    return notes.where((element) =>
      element.title!.toLowerCase().contains(searchQuery.toLowerCase())||
      element.content!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
  }

  void sortNotes() {
    notes.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
  }

  void addNote(Note note) {
    notes.add(note);
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(Note note) {
    int indexofNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexofNote] = note;
    sortNotes();
    notifyListeners();
    ApiService.updateNote(note);
  }

  void delectNote(Note note) {
    int indexofNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexofNote);
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes() async {
    notes = await ApiService.fetchNotes("faruk@gmail.com");
    sortNotes();
    isLoading = false;
    notifyListeners();
  }
}

// ignore_for_file: unused_import, prefer_final_fields, unused_local_variable
import 'dart:convert';
import 'dart:developer';

import 'package:frontend/models/notes.dart';
import 'package:http/http.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

class ApiService {
  // ignore: unused_field
  static String _baseUrl = "http://192.168.0.164:8080";
  static HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
]);

  static Future<void> addNote(Note note) async {
    // ignore: prefer_interpolation_to_compose_strings
    Uri requestUri = Uri.parse(_baseUrl + "/api/v1/notes/create-notes");
    var response = await http.post(requestUri, body: note.toCreate());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> updateNote(Note note) async {
    // ignore: prefer_interpolation_to_compose_strings
    Uri requestUri = Uri.parse(_baseUrl + "/api/v1/notes/update-notes");
    var response = await http.post(requestUri, body: note.toUpdate());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    // ignore: prefer_interpolation_to_compose_strings
    Uri requestUri = Uri.parse(_baseUrl + "/api/v1/notes/delect-notes");
    var response = await http.post(requestUri, body: note.toApp());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Note>> fetchNotes(String userid) async {
    // ignore: prefer_interpolation_to_compose_strings
    Uri requestUri = Uri.parse(_baseUrl + "/api/v1/notes/get-notes/");
    var response = await http.get(requestUri);
    var decodeed = jsonDecode(response.body);
    // log(decodeed.toString());
    //return [];
    List<Note> notes = [];
    for (var noteMap in decodeed['data']) {
      Note newNote = Note.fromMap(noteMap);
      notes.add(newNote);
    }
    return notes;
  }


}

import 'package:flutter/material.dart';
import 'package:quick_scribe/models/note_db.dart';

import 'pages/notes_page.dart';

void main() async {
  // initialize note isar DB
  WidgetsFlutterBinding.ensureInitialized();
  await NotesDb.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NotesPage(),
      ),
    );
  }
}

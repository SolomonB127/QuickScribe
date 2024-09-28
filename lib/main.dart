import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_scribe/models/note_db.dart';
import 'package:quick_scribe/theme/theme_provider.dart';

import 'pages/notes_page.dart';

void main() async {
  // initialize note isar DB
  WidgetsFlutterBinding.ensureInitialized();
  await NotesDb.initialize();

  runApp(

    MultiProvider(providers:[
      // Notes provider
      ChangeNotifierProvider(create: (context) => NotesDb()),
      // Theme Provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ] , child: const MainApp(),));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

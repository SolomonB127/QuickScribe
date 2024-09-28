import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_scribe/components/drawer.dart';
import 'package:quick_scribe/components/note_tile.dart';
import 'package:quick_scribe/models/note_db.dart';
import 'package:quick_scribe/models/notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller for tracking text strokes
  final _createController = TextEditingController();

  @override
  void initState() {
    super.initState();

// on app start-up, fetch existing notes
    readNotes();
  }

  // create a note
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: TextField(
                controller: _createController,
              ),
              actions: [
                // create note
                MaterialButton(
                  onPressed: () {
                    // add to db
                    context.read<NotesDb>().addNote(_createController.text);

                    // clear controller
                    _createController.clear();
                    // pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                )
              ],
            ));
  }

  // read a note
  void readNotes() {
    context.read<NotesDb>().fetchNotes();
  }

  // update a note
  void updateNote(Note note) {
    // pre-fill current note text
    _createController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: const Text("Update Note."),
              content: TextField(
                controller: _createController,
              ),
              actions: <Widget>[
                // update button
                MaterialButton(
                  onPressed: () {
                    context
                        .read<NotesDb>()
                        .updateNotes(note.id, _createController.text);
                    // clear controller
                    _createController.clear();

                    // pop dialog
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                )
              ],
            ));
  }

  // delete a note
  void deleteNote(int id) {
    context.read<NotesDb>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // notes DB
    final notesdb = context.watch<NotesDb>();

    // currents note
    List<Note> currentNote = notesdb.currentNotes;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          title: const Text("Notes"),
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu))),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => createNote,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text("Notes",
                style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),
          ),

          // LIST OF NOTES
          Expanded(
            child: ListView.builder(
              itemCount: currentNote.length,
              itemBuilder: (context, index) {
                // individual notes
                final note = currentNote[index];

                // List Ui
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

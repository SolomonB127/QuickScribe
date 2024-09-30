# Documentation: Flutter QuickScribe Application
## Overview

The **QuickScribe** application is a simple note-taking application built using the Flutter framework. It utilizes the **Isar Database** for local data persistence, and **Provider** for state management and theming. This documentation provides a thorough breakdown of the application's structure, functionality, and components.

## Table of Contents
1. **Getting Started**
2. **Project Structure**
3. **Application Flow**
4. **Main Components**
5. **Database Operations**
6. **Theme Management**
7. **Notes Page**
8. **Drawer and Settings**
9. **Note Tile & Settings**
10. **Demo Video and Screenshots**
11. **Contributing**
12. **Conclusions**
13. **License**

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- Android Studio or Visual Studio Code

# Installation
```
git clone https://github.com/SolomonB127/QuickScribe.git
cd QuickScribe
flutter pub get
flutter run
```

# Project Structure
```
lib
│
├── components/
│   ├── drawer.dart
│   ├── drawer_tile.dart
│   ├── note_tile.dart 
│   └── notes_settings.dart 
│
├── models/
│   ├── note_db.dart
│   └── notes.dart
├── pages/
│   └── notes_page.dart
│
├── theme/
│   └── theme_provider.dart
│
└── main.dart
```

## Application Flow

1,  **Main Entry Point** -  `main.dart`

The application initializes the Isar database and sets up Providers for managing:
-  The notes database.
-  The application theme (light/dark mode).

The application then runs the MainApp widget, which is a stateless widget that sets up the main MaterialApp.

2. **Database Initialization**

The Isar database is initialized in the NotesDb.initialize() method, which sets up the local storage directory and opens the database with the NoteSchema.

3. **State Management**

The application uses the Provider package to manage state for both the notes database and the theme settings. These providers are passed down the widget tree.

# Main Components
### `main.dart`
- ### **Providers**:
The MultiProvider widget is used to provide the NotesDb and ThemeProvider instances to the widget tree. This allows widgets to access the notes and theme data using Provider.of().

- ### **MainApp**:
The main application widget that sets up the MaterialApp. The app's theme is driven by the ThemeProvider.
```dart
runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => NotesDb()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ],
  child: const MainApp(),
));
```
# Database Operations
### `NotesDb (Notes Database)`
This class manages all operations related to the notes in the Isar database.
- ### **Initialization:**:
The database is initialized using the Isar.open() method, specifying the NoteSchema.

- ### **CRUD Operations**:
  - **Create** : Adds a new note to the database using the addNote() method.
  - **Read** : Fetches all notes with the fetchNotes() method.
  - **Update** : Updates an existing note using the updateNotes() method.
  - **Delete** : Deletes a note by its ID using the deleteNote() method.

# Theme Management
### `ThemeProvider`
The ThemeProvider class manages the application's theme (light/dark mode) using a ChangeNotifier. It provides a method for toggling the theme and notifies listeners when the theme changes.
```dart
class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemeData get themeData =>
      isDarkMode ? ThemeData.dark() : ThemeData.light();

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
```

# Notes Page
### `NotesPage`
The NotesPage is the main screen of the application where users can:

- View a list of notes.
- Create new notes..
- Edit or delete existing notes.

The notes are displayed in a ListView.builder, with each note represented by a NoteTile.

# Drawer and Settings
### `MyDrawer`
The MyDrawer widget provides a navigational drawer for the application. It includes links to the notes page and the settings page.
```dart
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(child: Icon(Icons.edit)),
          DrawerTile(
            title: "Notes",
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```
### `SettingsPage`
```dart
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Dark Mode"),
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
    );
  }
}
```

# Note Tile & Settings
### `NoteTile`
Each note is displayed as a NoteTile, which includes a popover menu for editing or deleting the note. The popover is provided by the showPopover method, which displays the NotesSettings widget when the menu button is pressed.

### `NotesSettings`
The NotesSettings widget is a simple popover menu that allows the user to either edit or delete a note.





# Demo Video and Screenshots

- **Demo Video:** A walkthrough of the app showcasing navigation and features. 
[Watch the demo video](assets/video/Demo_vid.mp4)

## Light Mode
- **Screenshots:**

Note Page,

![Notes Page](/assets/screenshots/Notespage.png)

  *Screenshot showing the Notes Page*

Side Bar, 

![Side Bar](/assets/screenshots/Sidebar.png)

  *Screenshot showing the Side Menu*

Pop-up,

![Pop-up](/assets/screenshots/Pop-up.png)

  *Screenshot showing the Pop-up*


![Dialog](/assets/screenshots/Dialog.png)

  *Screenshot showing  the Dialog Textfield*

## Dark Mode
Note Page,

![Notes Page](/assets/screenshots/DarkMode-Notespage.png)

  *Screenshot showing the Notes Page*

Side Bar, 

![Side Bar](/assets/screenshots/DarkMode-Sidebar.png)

  *Screenshot showing the Side Menu*

Pop-up,

![Pop-up](/assets/screenshots/DarkMode-Pop-up.png)

  *Screenshot showing the Pop-up*


![Dialog](/assets/screenshots/DarkMode-Dialog.png)

  *Screenshot showing  the Dialog Textfield*


## Contributing
Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.

## Conclusion
The **QuickScribe** application is a well-structured and functional note-taking app that leverages the **Isar Database** for data persistence and **Provider** for state management. The modular design makes it easy to scale and maintain the application.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
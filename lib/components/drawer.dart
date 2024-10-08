import 'package:flutter/material.dart';
import 'package:quick_scribe/components/drawer_tile.dart';
import 'package:quick_scribe/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: <Widget>[
          // header
          const DrawerHeader(
              child: Icon(
            Icons.edit,
            size: 20.0,
          )),

          const SizedBox(
            height: 25.0,
          ),

          // notes tile
          DrawerTile(
              title: "Notes",
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context)),

          // settings
          DrawerTile(
              title: "Settings",
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              })
        ],
      ),
    );
  }
}

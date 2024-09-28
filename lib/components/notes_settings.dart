import 'package:flutter/material.dart';

class NotesSettings extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  const NotesSettings({
    super.key,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Edit button
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap?.call();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        // Delete button
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap?.call();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

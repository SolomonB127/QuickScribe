import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:quick_scribe/components/notes_settings.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile({super.key, required this.text, required this.onEditPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(
          text,
        ),
        trailing:IconButton(onPressed: () => showPopover(context: context, bodyBuilder: (content) => const NotesSettings()), icon: const Icon(Icons.more_vert))
      ),
    );
  }
}

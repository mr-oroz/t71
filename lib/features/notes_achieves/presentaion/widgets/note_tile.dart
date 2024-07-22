
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/features/notes_achieves/domain/notes_model.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/note_detail_page.dart';

class NoteTile extends StatelessWidget {
  final NotesModel note;

  const NoteTile({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteDetailPage(
                  item: note,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (note.photo != null)
                    Image.memory(
                      note.photo!,
                      fit: BoxFit.cover,
                      height: 161,
                    ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(note.title ?? ''),
                        Gap(10),
                        Text(note.description ?? ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

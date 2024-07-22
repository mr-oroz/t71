import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/features/notes_achieves/domain/notes_model.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/note_detail_page.dart';
import 'package:t71/features/notes_achieves/presentaion/providers/note_provider.dart';

class NoteTabPage extends HookConsumerWidget {
  const NoteTabPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noteProviderProvider);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ).copyWith(top: 15),
      child: StaggeredGrid.count(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(state.notes.length, (index) {
          final item = state.notes[index];
          return NoteTile(note: item);
        }),
      ),
    );
  }
}

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

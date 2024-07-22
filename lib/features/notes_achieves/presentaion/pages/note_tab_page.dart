import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/features/notes_achieves/presentaion/providers/note_provider.dart';
import 'package:t71/features/notes_achieves/presentaion/widgets/note_tile.dart';

class NoteTabPage extends HookConsumerWidget {
  const NoteTabPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noteProviderProvider);
    return Column(
      children: [
        Gap(15),
        Flexible(
          child: state.notes.isNotEmpty
              ? GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 0.67,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(state.notes.length, (index) {
                    final item = state.notes[index];
                    return NoteTile(note: item);
                  }),
                )
              : Center(
                  child: Center(
                    child: Text(
                      'No notes',
                      style: AppFonts.w400f20.copyWith(
                        color: AppColors.text2,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

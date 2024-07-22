import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/features/notes_achieves/domain/notes_model.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/achieves_tab_page.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/add_note_page.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/note_tab_page.dart';
import 'package:t71/features/notes_achieves/presentaion/widgets/note_achieves_app_bar.dart';

class NotesAchievesPage extends HookConsumerWidget {
  const NotesAchievesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);
    //final state = ref.watch()
    return Scaffold(
      appBar: HoteAchievesAppBar(controller: controller),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: const [
                    NoteTabPage(),
                    AchievesTabPage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 5),
        child: Container(
          color: AppColors.blue,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNotePage(),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

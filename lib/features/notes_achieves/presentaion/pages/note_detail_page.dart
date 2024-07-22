import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:t71/features/notes_achieves/domain/notes_model.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/note_edit_page.dart';

class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({super.key, required this.item});
  final NotesModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const AppIcon(
                    AppIcons.icon_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? '',
                      style: AppFonts.w500f20,
                    ),
                    Text(
                      'Notes',
                      style: AppFonts.w400f13.copyWith(
                        color: AppColors.text2,
                      ),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotedEditPage(
                      item: item,
                    ),
                  ),
                );
              },
              icon: CircleAvatar(
                backgroundColor: AppColors.blue2,
                child: AppIcon(
                  AppIcons.pencil,
                  color: AppColors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(15),
            if (item.photo != null)
              Image.memory(
                item.photo!,
                height: 169,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            Gap(15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: Text(item.description ?? ''),
            )
          ],
        ),
      ),
    );
  }
}

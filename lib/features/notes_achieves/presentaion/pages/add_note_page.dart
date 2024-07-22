import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/utils/pick_image.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:t71/features/create_profile/presentation/widgets/custom_text_field.dart';
import 'package:t71/features/main/main_page.dart';
import 'package:t71/features/notes_achieves/domain/notes_model.dart';
import 'package:t71/features/notes_achieves/presentaion/providers/note_provider.dart';

class AddNotePage extends HookConsumerWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final titleCtrl = useTextEditingController();
    final noteCtrl = useTextEditingController();
    final image = useState<Uint8List?>(null);
    Future<void> selectedImage() async {
      image.value = await pickImage(context);
    }

    ref.listen<NodeState>(noteProviderProvider, (prev, next) {
      if (next.notes.length != prev!.notes.length) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(
                idx: 2,
              ),
            ),
            (Route<dynamic> route) => false);
      }
    });

    return Scaffold(
      appBar: GlAppBar(
        title: Row(
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
                  'Add note',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: titleCtrl,
                hintText: 'Title',
              ),
              Gap(15),
              GestureDetector(
                onTap: selectedImage,
                child: image.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 90,
                          width: double.infinity,
                          child: Image.memory(
                            image.value!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        dashPattern: const [10, 5],
                        color: AppColors.text2,
                        strokeWidth: 2,
                        child: Container(
                          height: 90,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'Add photo (optional)',
                              style: AppFonts.w400f14.copyWith(
                                color: AppColors.text2,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              const Gap(15),
              CustomTextField(
                not: true,
                maxLines: 3,
                controller: noteCtrl,
                hintText: 'Note (optional)',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: AppButton(
          height: 56,
          onPressed: () {
            if ( formKey.currentState!.validate() && titleCtrl.text.isNotEmpty && image.value != null) {
              ref.read(noteProviderProvider.notifier).addNote(
                    NotesModel(
                      title: titleCtrl.text,
                      description: noteCtrl.text,
                      photo: image.value,
                    ),
                  );
            }
          },
          title: 'Save',
          bgColor: AppColors.blue,
          textColor: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

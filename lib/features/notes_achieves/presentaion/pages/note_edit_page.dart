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

class NotedEditPage extends HookConsumerWidget {
  const NotedEditPage({
    super.key,
    required this.item,
  });
  final NotesModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleCtrl = useTextEditingController();
    final noteCtrl = useTextEditingController();
    final image = useState<Uint8List?>(null);
    Future<void> selectedImage() async {
      image.value = await pickImage(context);
    }

    useEffect(() {
      titleCtrl.text = item.title ?? '';
      noteCtrl.text = item.description ?? '';
      image.value = item.photo;
    }, []);

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
            IconButton(
              onPressed: () {
                ref.read(noteProviderProvider.notifier).deleteNote(item);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(idx: 2),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              icon: CircleAvatar(
                backgroundColor: AppColors.red2,
                child: AppIcon(
                  AppIcons.trash,
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomTextField(
              controller: titleCtrl,
              hintText: 'Title',
            ),
            Gap(15),
            if (image.value != null)
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: SizedBox(
                  height: 169,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.memory(
                        image.value!,
                        fit: BoxFit.cover,
                        height: 169,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: selectedImage,
                              icon: CircleAvatar(
                                backgroundColor: AppColors.blue2,
                                child: AppIcon(AppIcons.pencil,
                                    color: AppColors.blue),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                image.value = null;
                              },
                              icon: CircleAvatar(
                                backgroundColor: AppColors.red2,
                                child: AppIcon(AppIcons.close,
                                    color: AppColors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: selectedImage,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern:
                      image.value != null ? const [0.1, 0.1] : const [10, 5],
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
              maxLines: 3,
              controller: noteCtrl,
              hintText: 'Note (optional)',
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: AppButton(
          height: 56,
          onPressed: () {
            ref.read(noteProviderProvider.notifier).editNote(
                  NotesModel(
                    id: item.id,
                    photo: image.value,
                    title: titleCtrl.text,
                    description: noteCtrl.text,
                  ),
                );
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(
                          idx: 2,
                        )),
                (Route<dynamic> route) => false);
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

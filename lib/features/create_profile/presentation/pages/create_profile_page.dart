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
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:t71/features/add_game/presentation/pages/add_game_page.dart';
import 'package:t71/features/create_profile/domain/models/user_profile_model.dart';
import 'package:t71/features/create_profile/presentation/providers/create_profile_provider.dart';
import 'package:t71/features/create_profile/presentation/widgets/custom_drop_down.dart';
import 'package:t71/features/create_profile/presentation/widgets/custom_text_field.dart';

class CreateProfilePage extends HookConsumerWidget {
  const CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameCtrl = useTextEditingController();
    final ageCtrl = useTextEditingController();
    final favoriteCtrl = useTextEditingController();
    final gameLevel = useState<String>('Game Level');
    final selected = useState<List<String>>([
      'Beginner',
      'Intermediate',
      'Advanced',
    ]);
    final user = ref.watch(createProfileProvider);
    final image = useState<Uint8List?>(null);
    Future<void> selectedImage() async {
      image.value = await pickImage(context);
    }

    void _clearControllers() {
      nameCtrl.clear();
      ageCtrl.clear();
      favoriteCtrl.clear();
      image.value = null;
      gameLevel.value = 'Game Level'; 
    }

    return Scaffold(
      appBar: GlAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create profile',
              style: AppFonts.w500f20,
            ),
            Text(
              'You can change this info later',
              style: AppFonts.w400f13.copyWith(
                color: AppColors.text2,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: nameCtrl,
                  hintText: 'Name',
                ),
                const Gap(15),
                GestureDetector(
                  onTap: selectedImage,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [10, 5],
                    color: AppColors.text2,
                    strokeWidth: 2,
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
                        : Container(
                            height: 90,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'Add photo',
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
                  controller: ageCtrl,
                  hintText: 'Age',
                  type: TextInputType.number,
                ),
                const Gap(15),
                CustomTextField(
                  controller: favoriteCtrl,
                  hintText: 'Favorite beats',
                  maxLines: 3,
                  type: TextInputType.number,
                ),
                const Gap(15),
                CustomDropDown(
                  list: selected.value,
                  title: gameLevel.value,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AppButton(
          bgColor: AppColors.blue,
          textColor: AppColors.white,
          onPressed: () {
            if (nameCtrl.text.isNotEmpty &&
                gameLevel.value != 'Game level' &&
                favoriteCtrl.text.isNotEmpty &&
                ageCtrl.text.isNotEmpty &&
                ageCtrl.text.isNotEmpty &&
                image.value != null) {
              ref.read(createProfileProvider.notifier).createUser(
                    UserProfileModel(
                      username: nameCtrl.text,
                      age: ageCtrl.text,
                      gameLevel: gameLevel.value,
                      favoriteBeats: favoriteCtrl.text,
                      photo: image.value,
                    ),
                  );
              _clearControllers();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddGamePage(),
                ),
              );
            }
          },
          height: 56,
          title: 'Continue',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

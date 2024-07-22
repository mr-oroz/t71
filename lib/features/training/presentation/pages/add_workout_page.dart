import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:t71/features/add_game/domain/models/add_game_model.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/create_profile/presentation/widgets/custom_drop_down.dart';
import 'package:t71/features/create_profile/presentation/widgets/custom_text_field.dart';
import 'package:t71/features/main/main_page.dart';
import 'package:t71/features/training/domain/add_training_model.dart';
import 'package:t71/features/training/presentation/providers/add_workout_provider.dart';

class AddWorkoutPage extends HookConsumerWidget {
  const AddWorkoutPage({super.key, this.item});
  final AddGameModel? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(addWorkoutProviderProvider);
    final typeTimer = ref.watch(addGameProviderProvider).typeTimer;

    final placeOfWorkouttrl = useTextEditingController();
    final nameCoachCtrl = useTextEditingController();
    final durationCtrl = useTextEditingController();
    final noteCtrl = useTextEditingController();
    final type = useState<String>('Type of Workout');
    final selectedType = useState<List<String>>([
      'Strike technique',
      'Physical training',
      'Tactical training',
    ]);
    final intensity = useState<String>('Workout intensity');
    final selectIntensity = useState<List<String>>([
      'Low',
      'Medium',
      'Hight',
    ]);

    useEffect(() {
      if (item != null) {
        placeOfWorkouttrl.text = item!.placeOfName ?? '';
        nameCoachCtrl.text = item!.nameOpponent ?? '';
        noteCtrl.text = item!.note ?? '';
      }
    }, [item]);

    void onSelectType(String value) {
      type.value = value;
    }

    void onSelectIntensity(String value) {
      intensity.value = value;
    }

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
                  'Add workout',
                  style: AppFonts.w500f20,
                ),
                Text(
                  'other info',
                  style: AppFonts.w400f13.copyWith(
                    color: AppColors.text2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          children: [
            Text('Select date', style: AppFonts.w400f14),
            const Gap(15),
            CustomTextField(
              controller: nameCoachCtrl,
              hintText: 'Place of workout',
            ),
            const Gap(15),
            CustomTextField(
              controller: placeOfWorkouttrl,
              hintText: 'Name coach',
            ),
            const Gap(15),
            CustomTextField(
              type: TextInputType.number,
              controller: durationCtrl,
              hintText: 'Duration of training (Hours)',
            ),
            const Gap(15),
            const Gap(15),
            CustomDropDown(
              onSelect: onSelectType,
              list: selectedType.value,
              title: type.value,
            ),
            const Gap(15),
            CustomDropDown(
              onSelect: onSelectIntensity,
              list: selectIntensity.value,
              title: intensity.value,
            ),
            const Gap(15),
            CustomTextField(
              maxLines: 3,
              controller: noteCtrl,
              hintText: 'Note (optional)',
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AppButton(
          height: 56,
          onPressed: () {
            if (nameCoachCtrl.text.isNotEmpty &&
                placeOfWorkouttrl.text.isNotEmpty &&
                durationCtrl.text.isNotEmpty &&
                intensity.value != 'Workout intensity' &&
                type.value != 'Type of Workout') {
              ref.read(addWorkoutProviderProvider.notifier).addWorkout(
                    AddTrainingModel(
                      nameCouch: nameCoachCtrl.text,
                      placeWorkout: placeOfWorkouttrl.text,
                      duration: durationCtrl.text,
                      intensiry: intensity.value,
                      typeWorkout: type.value,
                      timer: '${gameState.hour}:${gameState.minute} $typeTimer',
                      date: gameState.focusedDay,
                      city: 'Los Angeles',
                      note: noteCtrl.text,
                    ),
                  );
            } 
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainPage(idx: 1,)),
                (Route<dynamic> route) => false);
          },
          title: 'Add',
          bgColor: AppColors.blue,
          textColor: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

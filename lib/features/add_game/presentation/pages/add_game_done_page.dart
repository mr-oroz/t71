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
import 'package:t71/features/create_profile/presentation/widgets/custom_text_field.dart';
import 'package:t71/features/main/main_page.dart';

class AddGameDonePage extends HookConsumerWidget {
  const AddGameDonePage({super.key, this.item});
  final AddGameModel? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final gameState = ref.watch(addGameProviderProvider);
    final placeOfNameCtrl = useTextEditingController();
    final nameOpponentCtrl = useTextEditingController();
    final locationCtrl = useTextEditingController();

    final noteCtrl = useTextEditingController();

    useEffect(() {
      if (item != null) {
        placeOfNameCtrl.text = item!.placeOfName ?? '';
        nameOpponentCtrl.text = item!.nameOpponent ?? '';
        noteCtrl.text = item!.note ?? '';
        locationCtrl.text = item!.city ?? '';
      }
    }, [item]);

    ref.listen<AddGameState>(addGameProviderProvider, (prev, next) {
      if (next.addGames.isNotEmpty) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(
              idx: 0,
            ),
          ),
          ((Route<dynamic> route) => false),
        );
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
                  'Add game',
                  style: AppFonts.w500f20,
                ),
                Text(
                  'Select date and time',
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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            children: [
              Text('Select date', style: AppFonts.w400f14),
              const Gap(15),
              CustomTextField(
                controller: placeOfNameCtrl,
                hintText: 'Place of game',
              ),
              const Gap(15),
              CustomTextField(
                controller: nameOpponentCtrl,
                hintText: 'Name of opponent',
              ),
              const Gap(15),
              CustomTextField(
                controller: locationCtrl,
                hintText: 'Location',
              ),
              const Gap(15),
              CustomTextField(
                not: true,
                maxLines: 3,
                controller: noteCtrl,
                hintText: 'Note (optional)',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AppButton(
          height: 56,
          onPressed: () {
            if (_formKey.currentState!.validate() &&
                nameOpponentCtrl.text.isNotEmpty &&
                placeOfNameCtrl.text.isNotEmpty &&
                locationCtrl.text.isNotEmpty) {
              if (item != null) {
                ref.read(addGameProviderProvider.notifier).updateGame(
                      AddGameModel(
                        id: item!.id,
                        nameOpponent: nameOpponentCtrl.text,
                        placeOfName: placeOfNameCtrl.text,
                        note: noteCtrl.text.isEmpty ? '' : noteCtrl.text,
                        timer:
                            '${gameState.hour}:${gameState.minute} ${gameState.typeTimer}',
                        date: gameState.focusedDay,
                        city: locationCtrl.text,
                      ),
                    );
                ref
                    .read(addGameProviderProvider.notifier)
                    .filterGames(gameState.focusedDay!);
              } else {
                ref.read(addGameProviderProvider.notifier).addGame(
                      AddGameModel(
                        nameOpponent: nameOpponentCtrl.text,
                        placeOfName: placeOfNameCtrl.text,
                        note: noteCtrl.text.isEmpty ? '' : noteCtrl.text,
                        timer:
                            '${gameState.hour}:${gameState.minute} ${gameState.typeTimer}',
                        date: gameState.focusedDay,
                        city: locationCtrl.text,
                      ),
                    );
                ref
                    .read(addGameProviderProvider.notifier)
                    .filterGames(gameState.focusedDay!);
              }
            }
          },
          title: 'Done',
          bgColor: AppColors.blue,
          textColor: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

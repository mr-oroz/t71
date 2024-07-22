import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';

import 'package:t71/features/training/presentation/pages/add_game_training_page.dart';
import 'package:t71/features/training/presentation/widgets/training_list.dart';

class TrainingPage extends HookConsumerWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: GlAppBar(
        title: Text(
          'Training Log',
          style: AppFonts.w500f20,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: TrainingList()
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
                      builder: (context) => const AddGameTrainingPage()));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

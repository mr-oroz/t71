import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/widgets/wsb_bottom_navigation_bottom_bar.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/create_profile/presentation/providers/create_profile_provider.dart';
import 'package:t71/features/home/presentation/pages/home_page.dart';
import 'package:t71/features/notes_achieves/presentaion/pages/notes_achieves_page.dart';
import 'package:t71/features/notes_achieves/presentaion/providers/note_provider.dart';
import 'package:t71/features/profile/presentation/pages/profile_page.dart';
import 'package:t71/features/training/presentation/pages/training_page.dart';
import 'package:t71/features/training/presentation/providers/add_workout_provider.dart';

class MainPage extends HookConsumerWidget {
  const MainPage( {super.key, this.idx});
  final int? idx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(createProfileProvider).user;
    ref.watch(addGameProviderProvider);
    ref.watch(addWorkoutProviderProvider);
    ref.watch(noteProviderProvider);
    final selectedIndex = useState<int>(0);
    final List<Widget> pages = [
    const HomePage(),
    const TrainingPage(),
    const NotesAchievesPage(),
    const ProfilePage()
  ];

  useEffect(() {
    if(idx != null) {
      selectedIndex.value = idx!;
    }
  },[]);

    void onSelected(int index) {
      selectedIndex.value = index;
    }

    return Scaffold(
      body: Center(child: pages[selectedIndex.value]),
      bottomNavigationBar: WSBBottomNavigationBar(
        onSelected: onSelected,
        selectedIndex: selectedIndex.value,
      ),
    );
  }
}

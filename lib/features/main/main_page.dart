import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/widgets/wsb_bottom_navigation_bottom_bar.dart';
import 'package:t71/features/home/presentation/pages/home_page.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    final List<Widget> pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage()
  ];

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

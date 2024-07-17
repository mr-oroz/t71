import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/widgets/app_icons.dart';

class WSBBottomNavigationBar extends StatelessWidget {
  const WSBBottomNavigationBar({
    super.key,
    required this.onSelected,
    required this.selectedIndex,
  });

  final ValueChanged<int> onSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final items = [
      WSBBottomNavigationBarItem(
        icon: AppIcons.house,
      ),
      WSBBottomNavigationBarItem(
        icon: AppIcons.date,
      ),
      WSBBottomNavigationBarItem(
        icon: AppIcons.newspaper,
      ),
      WSBBottomNavigationBarItem(
        icon: AppIcons.settings,
      ),
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.text2,
      currentIndex: selectedIndex,
      onTap: onSelected,
      items: List.generate(
        items.length,
        (index) {
          final item = items[index];
          return BottomNavigationBarItem(
            icon: Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AppIcon(item.icon),
              ),
            ),
            activeIcon: Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width / 0.5),
                ),
                child: AppIcon(
                  item.icon,
                  color: AppColors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WSBBottomNavigationBarItem {
  final AppIcons icon;

  WSBBottomNavigationBarItem({
    required this.icon,
  });
}

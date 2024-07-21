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

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 84,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () => onSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? AppColors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 5),
                      ),
                      child: AppIcon(
                        items[index].icon,
                        color: selectedIndex == index
                            ? AppColors.white
                            : AppColors.text2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
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

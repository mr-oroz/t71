import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_icons.dart';

class CustomDropDown extends HookConsumerWidget {
  const CustomDropDown({
    super.key,
    required this.list,
    required this.title,
    required this.onSelect,
    required this.selectedIdx,
    required this.onSelectedIdx,
  });
  final String title;
  final List<String> list;
  final int selectedIdx;
  final Function(String value) onSelect;
  final Function(int value) onSelectedIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(selectedIdx);
    final selectedTitle = useState<String>(title);
    final selectedList = useState<List<String>>(list);
    final isFound = useState<bool>(false);

    void toggleDropDown() {
      isFound.value = !isFound.value;
    }

    return Column(
      children: [
        GestureDetector(
          onTap: toggleDropDown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTitle.value,
                  style: AppFonts.w400f14.copyWith(
                    color: AppColors.text2,
                  ),
                ),
                AppIcon(
                  isFound.value ? AppIcons.down : AppIcons.up,
                  color: AppColors.text2,
                )
              ],
            ),
          ),
        ),
        const Gap(15),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            height: isFound.value ? null : 0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: List.generate(
                selectedList.value.length,
                (index) {
                  bool isActive = selectedIndex.value == index;
                  return InkWell(
                    onTap: () {
                      selectedIndex.value = index;
                      selectedTitle.value = selectedList.value[index];
                      onSelect(selectedList.value[index]);
                      isFound.value = false;
                      onSelectedIdx(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: index == 1 ? AppColors.back : AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  isActive ? AppColors.blue : AppColors.blue2,
                            ),
                            child: isActive
                                ? const AppIcon(
                                    AppIcons.approve,
                                    color: AppColors.white,
                                  )
                                : null,
                          ),
                          Text(
                            selectedList.value[index],
                            style: AppFonts.w400f14,
                          ),
                          Container()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

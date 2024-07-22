import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:t71/features/create_profile/presentation/providers/create_profile_provider.dart';
import 'package:t71/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:t71/features/profile/presentation/pages/support_page.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createProfileProvider).user;
    Color getColorType(String title) {
      if (title == 'Intermediate') {
        return AppColors.blue;
      } else if (title == 'Beginner') {
        return AppColors.green;
      } else {
        return AppColors.yellow;
      }
    }

    void _showModalDeleteConfirm(BuildContext context) {
      showDialog(
        context: context,
        barrierColor: AppColors.blue2.withOpacity(0.3),
        useRootNavigator: true,
        builder: (
          context,
        ) {
          return Dialog(
            backgroundColor: AppColors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: AppIcon(AppIcons.close),
                        )
                      ],
                    ),
                    Gap(10),
                    Text(
                      'Your request has been accepted! We will contact you within 24 hours',
                      textAlign: TextAlign.center,
                      style: AppFonts.w500f20,
                    ),
                    Gap(10),
                    AppButton(
                      height: 44,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingPage(),
                          ),
                          ((Route<dynamic> route) => false),
                        );
                      },
                      title: 'Ok',
                      bgColor: AppColors.blue,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    void _showModalDeleteAccount(BuildContext context) {
      showDialog(
        context: context,
        barrierColor: AppColors.blue2.withOpacity(0.3),
        useRootNavigator: true,
        builder: (
          context,
        ) {
          return Dialog(
            backgroundColor: AppColors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: AppIcon(AppIcons.close),
                        )
                      ],
                    ),
                    Gap(10),
                    Text(
                      'Are you sure you want to delete your account?',
                      textAlign: TextAlign.center,
                      style: AppFonts.w500f20,
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Flexible(
                          child: AppButton(
                            height: 44,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: 'Cansel',
                            bgColor: AppColors.blue,
                            textColor: AppColors.white,
                          ),
                        ),
                        Gap(10),
                        Flexible(
                          child: AppButton(
                            height: 44,
                            onPressed: () {
                              ref
                                  .read(createProfileProvider.notifier)
                                  .deleteUser();
                              Navigator.pop(context);
                              _showModalDeleteConfirm(context);
                            },
                            title: 'Delete',
                            bgColor: AppColors.white,
                            textColor: AppColors.text,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    final isActive = useState<bool>(true);
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
                  onPressed: () {},
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state?.username}',
                      style: AppFonts.w500f20,
                    ),
                    Text(
                      'Profile',
                      style: AppFonts.w400f13.copyWith(
                        color: AppColors.text2,
                      ),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: AppColors.blue2,
                child: AppIcon(
                  AppIcons.pencil,
                  color: AppColors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 5,
                          ),
                          border: Border.all(
                            color: AppColors.blue,
                          )),
                      child: CircleAvatar(
                        child: state != null && state.photo != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 5),
                                child: Image.memory(
                                  state.photo!,
                                  width: 95,
                                  height: 95,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                'assets/images/welcome1.png',
                              ),
                      ),
                    ),
                    Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: getColorType('${state?.gameLevel}'),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            '${state?.gameLevel}',
                            style: AppFonts.w400f14.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Gap(10),
                        Text(
                          'Old: ${state?.age}',
                          style: AppFonts.w400f14,
                        ),
                        Gap(5),
                        Text(
                          'Favorite beats:',
                          style: AppFonts.w400f14,
                        ),
                        Gap(5),
                        Text(
                          '${state?.favoriteBeats}',
                          style: AppFonts.w400f14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(15),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notifications', style: AppFonts.w400f16),
                        FlutterSwitch(
                          activeColor: AppColors.blue,
                          inactiveColor: Colors.grey,
                          width: 70.0,
                          height: 34.0,
                          toggleSize: 26.0,
                          value: isActive.value,
                          borderRadius: 30.0,
                          onToggle: (val) {
                            isActive.value = val;
                          },
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rate us', style: AppFonts.w400f16),
                        GestureDetector(
                          onTap: () {},
                          child: AppIcon(AppIcons.right),
                        )
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Support', style: AppFonts.w400f16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SupportPage(),
                              ),
                            );
                          },
                          child: AppIcon(AppIcons.right),
                        )
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delete account',
                          style:
                              AppFonts.w400f16.copyWith(color: AppColors.red),
                        ),
                        GestureDetector(
                          onTap: () => _showModalDeleteAccount(context),
                          child: AppIcon(AppIcons.right, color: AppColors.red),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

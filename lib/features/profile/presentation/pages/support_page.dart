import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:t71/features/create_profile/presentation/widgets/custom_text_field.dart';
import 'package:t71/features/main/main_page.dart';

class SupportPage extends HookConsumerWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteCtrl = useTextEditingController();

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
                                  builder: (context) => MainPage(idx: 3),
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GlAppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(
              'Support',
              style: AppFonts.w500f20,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Note (optional)',
                style: AppFonts.w400f14,
              ),
              Gap(5),
              CustomTextField(
                maxLines: 6,
                controller: noteCtrl,
                hintText: '',
              ),
              Spacer(),
              AppButton(
                height: 56,
                onPressed: () {
                  _showModalDeleteConfirm(context);
                },
                title: 'Send',
                bgColor: AppColors.blue,
                textColor: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/features/onboarding/presentation/widgets/step1_widget.dart';
import 'package:t71/features/onboarding/presentation/widgets/step2_widget.dart';
import 'package:t71/features/onboarding/presentation/widgets/step3_widget.dart';
import 'package:t71/features/onboarding/presentation/widgets/step4_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final CarouselController _controller = CarouselController();
  int selectedIndex = 0;
  final List<Widget> widgets = [
    const Step1Widget(),
    const Step2Widget(),
    const Step3Widget(),
    const Step4Widget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 10,
                child: CarouselSlider(
                  items: widgets,
                  carouselController: _controller,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          selectedIndex = index;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          if(selectedIndex < 3) Positioned(
            bottom: 120,
            left: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widgets.length - 1,
                (index) => buildDot(
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AppButton(
          onPressed: () {
            setState(() {
              if (selectedIndex < widgets.length - 1) {
                _controller.nextPage();
              } else {}
            });
          },
          height: 56,
          title: 'Next',
          bgColor: AppColors.white,
          textColor: AppColors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: selectedIndex == index ? 18 : 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular( selectedIndex == index ? 12 : 3),
        ),
      ),
    );
  }
}

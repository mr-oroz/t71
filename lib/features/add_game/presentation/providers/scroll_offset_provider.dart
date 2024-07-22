import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScrollOffsetNotifier extends StateNotifier<double> {
  ScrollOffsetNotifier() : super(0.0);

  void setOffset(double offset) {
    state = offset;
  }
}

final scrollOffsetProvider = StateNotifierProvider<ScrollOffsetNotifier, double>((ref) {
  return ScrollOffsetNotifier();
});
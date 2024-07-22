import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t71/features/training/domain/add_training_model.dart';
import 'package:uuid/uuid.dart';

part 'add_workout_provider.freezed.dart';
part 'add_workout_provider.g.dart';

@freezed
class AddWorkoutState with _$AddWorkoutState {
  const factory AddWorkoutState({
    @Default([]) List<AddTrainingModel> workouts,
    DateTime? focusedDay,
    @Default(10) int minute,
    @Default(10) int hour,
  }) = _AddWorkoutState;

  factory AddWorkoutState.initial() {
    return AddWorkoutState(
      focusedDay: DateTime.now(),
    );
  }
}

@riverpod
class AddWorkoutProvider extends _$AddWorkoutProvider {
  @override
  AddWorkoutState build() {
    return AddWorkoutState.initial();
  }

  void addWorkout(AddTrainingModel body) {
    final id = Uuid().v1();
    final update = body.copyWith(id: id);
    state = state.copyWith(
      workouts: [update, ...state.workouts],
    );
  }

  void clearDataState () {
    state = state.copyWith(workouts: []);
  }

  void onMonthChanged(DateTime month) {
    state = state.copyWith(
      focusedDay: DateTime(month.year, month.month, 1),
    );
  }

  void onDateChange(DateTime selected) {
    state = state.copyWith(focusedDay: selected);
  }

  void onHour(int hour) {
    state = state.copyWith(hour: hour);
  }

  void onMinute(int min) {
    state = state.copyWith(minute: min);
  }
}

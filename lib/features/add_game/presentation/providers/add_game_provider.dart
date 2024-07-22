import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t71/features/add_game/domain/models/add_game_model.dart';
import 'package:uuid/uuid.dart';

part 'add_game_provider.freezed.dart';
part 'add_game_provider.g.dart';

@freezed
class AddGameState with _$AddGameState {
  const factory AddGameState({
    @Default([]) List<AddGameModel> addGames,
    @Default([]) List<AddGameModel> historyGames,
    @Default([]) List<AddGameModel> filteredGames,
    @Default([]) List<AddGameModel> filteredHistory,
    DateTime? focusedDay,
    @Default(10) int minute,
    @Default(10) int hour,
    @Default('AM') String typeTimer,
    final AddGameModel? gameCard,
  }) = _AddGameState;

  factory AddGameState.initial() {
    return AddGameState(
      focusedDay: DateTime.now(),
    );
  }
}

@riverpod
class AddGameProvider extends _$AddGameProvider {
  @override
  AddGameState build() {
    return AddGameState.initial();
  }

  void addGame(AddGameModel body) {
    final updateGame = body.copyWith(id: const Uuid().v1());
    state = state.copyWith(addGames: [
      updateGame,
      ...state.addGames,
    ]);
  }

  void filterGames(DateTime date) {
    final filteredGames = state.addGames.where((game) {
      return game.date?.year == date.year &&
          game.date?.month == date.month &&
          game.date?.day == date.day;
    }).toList();
    state = state.copyWith(filteredGames: filteredGames);
  }

  void filterHistory(DateTime date) {
    final filteredHistory = state.historyGames.where((game) {
      return game.date?.year == date.year &&
          game.date?.month == date.month &&
          game.date?.day == date.day;
    }).toList();
    state = state.copyWith(filteredHistory: filteredHistory);
  }

  void cleareDataState() {
    state = state.copyWith(
      addGames: [],
      filteredGames: [],
      filteredHistory: [],
      historyGames: [],
      gameCard: null,
    );
  }

  void toggleIsReditGame(AddGameModel body) {
    final updateGames = state.addGames.map((item) {
      if (body.id == item.id) {
        return item.copyWith(isRedicActive: !item.isRedicActive);
      }
      return item;
    }).toList();
    state = state.copyWith(
      addGames: updateGames,
      gameCard: body,
    );
  }

  void clearFilter() {
    state = state.copyWith(filteredGames: state.addGames);
  }

  void clearActive() {
    final updateGames = state.addGames.map((item) {
      return item.copyWith(isRedicActive: false);
    }).toList();
    state = state.copyWith(
      addGames: updateGames,
      gameCard: null,
    );
  }

  void addHistoryGames(AddGameModel body) {
    final updateHistory = [body, ...state.historyGames];
    state = state.copyWith(historyGames: updateHistory);
  }

  void deleteGame(String id) {
    final updateGames = state.addGames.where((item) => item.id != id).toList();
    state = state.copyWith(addGames: updateGames);
  }

  void updateGame(AddGameModel body) {
    var updateGames = state.addGames.map((item) {
      if (item.id == body.id) {
        return item.copyWith(
          city: body.city ?? item.city,
          date: body.date ?? item.date,
          nameOpponent: body.nameOpponent ?? item.nameOpponent,
          note: body.note ?? item.note,
          timer: body.timer ?? item.timer,
          placeOfName: body.placeOfName ?? item.placeOfName,
        );
      }
      return item;
    }).toList();
    state = state.copyWith(addGames: updateGames);
  }

  void onMonthChanged(DateTime month) {
    state = state.copyWith(focusedDay: DateTime(month.year, month.month, 1));
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

  void changeTypeTimer(bool isAm) {
    state = state.copyWith(typeTimer: isAm ? 'AM' : "PM");
  }
}

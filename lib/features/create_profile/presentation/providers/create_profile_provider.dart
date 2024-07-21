import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t71/features/create_profile/domain/models/user_profile_model.dart';
import 'package:uuid/uuid.dart';

part 'create_profile_provider.freezed.dart';
part 'create_profile_provider.g.dart';

@freezed
class UserProfilestate with _$UserProfilestate {
  const factory UserProfilestate({
    final UserProfileModel? user,
  }) = _UserProfilestate;

  factory UserProfilestate.initial() {
    return  const UserProfilestate(user: null);
  }
}

@riverpod
class CreateProfile extends _$CreateProfile {
  @override
  UserProfilestate build() {
    return UserProfilestate.initial();
  }

  void createUser(UserProfileModel user) {
    final userId = const Uuid().v1();
    final updateUser = user.copyWith(uuid: userId);
    state = state.copyWith(user: updateUser);
  }

  void deleteUser() {
    state = state.copyWith(user: null);
  }

  void editUser(UserProfileModel user) {
    final currentState = state.user;
    if (currentState != null) {
      final updateUser = currentState.copyWith(
        age: user.age ?? currentState.age,
        username: user.username ?? currentState.username,
        photo: user.photo ?? currentState.photo,
        gameLevel: user.gameLevel ?? currentState.gameLevel,
        favoriteBeats: user.favoriteBeats ?? currentState.favoriteBeats,
      );
      state = state.copyWith(user: updateUser);
    }
  }
}

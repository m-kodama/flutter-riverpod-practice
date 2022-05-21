import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/13/home_screen_state.dart';

final homeScreenNotifierProvider =
    StateNotifierProvider.autoDispose<HomeScreenNotifier, HomeScreenState>(
        (ref) {
  return HomeScreenNotifier(ref.read);
});

class HomeScreenNotifier extends StateNotifier<HomeScreenState> {
  HomeScreenNotifier(
    this._read,
  ) : super(const HomeScreenState());

  final Reader _read;

  Future<void> increaseMainCount() async {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  Future<void> increaseSubCount() async {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  Future<void> resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}

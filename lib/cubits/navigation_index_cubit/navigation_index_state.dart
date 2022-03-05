part of 'navigation_index_cubit.dart';

class NavigationIndexState {
  final int currentIndex;

  NavigationIndexState({required this.currentIndex});

  factory NavigationIndexState.initial() {
    return NavigationIndexState(
      currentIndex: 0,
    );
  }

  NavigationIndexState copyWith({
    int? currentIndex,
  }) {
    return NavigationIndexState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

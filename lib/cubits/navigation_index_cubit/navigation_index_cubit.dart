import 'package:bloc/bloc.dart';

part 'navigation_index_state.dart';

class NavigationIndexCubit extends Cubit<NavigationIndexState> {
  NavigationIndexCubit() : super(NavigationIndexState.initial());

  Future<void> changeIndex(int index)  async {
   emit(state.copyWith(currentIndex: index));
  }
}

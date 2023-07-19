part of 'savedcat_state.dart';

class SavedCatCubit extends Cubit<SavedCatState> {
  SavedCatCubit() : super(const SavedCatInitialState());

  // Logics
  CatDB catDb = CatDB();

  Future<void> getAllCats() async {
    emit(const SavedCatLoadingState());
    dynamic response = await catDb.getAllCats();

    if (response is List<CatModel>) {
      emit(SavedCatCompleteState(response));
    } else if (response is String) {
      emit(SavedCatErrorState(response));
    }
  }
}

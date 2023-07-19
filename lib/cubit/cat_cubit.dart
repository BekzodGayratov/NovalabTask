part of 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit() : super(const CatInitialState()) {
    getRandomCats();
  }

  // Logics
  CatDB catDb = CatDB();

  Future<void> getRandomCats() async {
    emit(const CatLoadingState());
    dynamic response = await catDb.getRandomCat();
    if (response is CatModel) {
      emit(CatCompleteState(response));
    } else if (response is String) {
      emit(CatErrorState(response));
    }
  }

  
}

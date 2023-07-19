import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novalabtask/db/cat_db.dart';
import 'package:novalabtask/model/cat_model.dart';

part 'savedcat_cubit.dart';

abstract class SavedCatState extends Equatable {
  const SavedCatState();

  @override
  List<Object?> get props => [];
}

class SavedCatInitialState extends SavedCatState {
  const SavedCatInitialState();

  @override
  List<Object?> get props => [];
}

class SavedCatLoadingState extends SavedCatState {
  const SavedCatLoadingState();

  @override
  List<Object?> get props => [];
}

class SavedCatCompleteState extends SavedCatState {
  final List<CatModel> model;
  const SavedCatCompleteState(this.model);

  @override
  List<Object?> get props => [model];
}

class SavedCatErrorState extends SavedCatState {
  final String errorMessage;
  const SavedCatErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:novalabtask/db/cat_db.dart';
import 'package:novalabtask/model/cat_model.dart';
part 'cat_cubit.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object?> get props => [];
}

class CatInitialState extends CatState {
  const CatInitialState();

  @override
  List<Object?> get props => [];
}

class CatLoadingState extends CatState {
  const CatLoadingState();

  @override
  List<Object?> get props => [];
}

class CatCompleteState extends CatState {
  final CatModel model;
  const CatCompleteState(this.model);

  @override
  List<Object?> get props => [model];
}

class CatErrorState extends CatState {
  final String errorMessage;
  const CatErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

import 'package:cocoon_kids_flutter/models/entry_points.dart';
import 'package:cocoon_kids_flutter/repository/entry_point_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EntryPointsState { }

class EntryPointsInitState extends EntryPointsState {}

class EntryPointsLoadedState extends EntryPointsState {
  final List<EntryPoint> entryPoints;

  EntryPointsLoadedState(this.entryPoints);
}

class EntryPointsCubit extends Cubit<EntryPointsState> {
  final repository = EntryPointRepositoryImpl();

  EntryPointsCubit() : super(EntryPointsInitState()) {
    repository.getEntryPoints().listen((event) {
      emit(EntryPointsLoadedState(event));
    });
  }
}
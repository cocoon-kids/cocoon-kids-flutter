import 'package:cocoon_kids_flutter/models/entry_points.dart';
import 'package:cocoon_kids_flutter/repository/entry_point_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EntryPointsState { }

class EntryPointsInitState extends EntryPointsState {}

class EntryPointsLoadedState extends EntryPointsState {
  final List<EntryPoint> entryPoints;

  EntryPointsLoadedState(this.entryPoints);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntryPointsLoadedState &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(entryPoints, other.entryPoints);

  @override
  int get hashCode => entryPoints.hashCode;
}

class EntryPointsCubit extends Cubit<EntryPointsState> {
  final EntryPointRepository repository;

  EntryPointsCubit({this.repository = const EntryPointRepositoryImpl()})  : super(EntryPointsInitState()) {
    repository.getEntryPoints().listen((event) {
      emit(EntryPointsLoadedState(event));
    });
  }
}
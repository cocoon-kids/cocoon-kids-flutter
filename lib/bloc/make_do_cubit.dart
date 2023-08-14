import 'package:cocoon_kids_flutter/repository/make_do_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstructionUiModel {
  final String? imagePath;
  final List<String> steps;

  InstructionUiModel(this.imagePath, this.steps);
}

class MakeDoUiModel {
  final String title;
  final String description;
  final String? imagePath;
  final List<String>? howItHelps;
  String? caution;
  final List<String> materials;
  final List<InstructionUiModel> instructions;

  MakeDoUiModel(this.title, this.description, this.imagePath, this.howItHelps, this.caution,
      this.materials, this.instructions);
}

abstract class MakeDoState {}

class MakeDoInitState extends MakeDoState { }

class MakeDoLoadedState extends MakeDoState {
  final MakeDoUiModel model;

  MakeDoLoadedState(this.model);
}

class MakeDoCubit extends Cubit<MakeDoState> {
  final int id;
  final MakeDoRepository repository;

  MakeDoCubit(this.id, [this.repository = const MakeDoRepositoryImpl()]): super(MakeDoInitState()) {
    repository.getMakeDoById(id).listen((event) {
      final imagePath = event.src == null ? null : "assets/images/do/${event.src}";
      emit(MakeDoLoadedState(
          MakeDoUiModel(
              event.title,
              event.description,
              imagePath,
              event.howItHelps,
              event.caution,
              event.materials,
              event.instructions.map((e) {
                final instrImagePath = e.src == null ? null : "assets/images/do/${e.src}";

                return InstructionUiModel(instrImagePath, e.step);
              }).toList()
          )
      ));
    });
  }
}
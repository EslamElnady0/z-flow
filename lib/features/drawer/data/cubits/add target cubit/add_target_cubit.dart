import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/drawer/data/models/target%20model/target_model.dart';

part 'add_target_state.dart';

class AddTargetCubit extends Cubit<AddTargetState> {
  AddTargetCubit() : super(AddTargetInitial());

  addTarget(TargetModel targetModel) async {
    emit(AddTargetLoading());
    try {
      var targetBox = Hive.box<TargetModel>(Constants.targetBox);
      await targetBox.add(targetModel);
      emit(AddTargetSuccess());
    } catch (e) {
      emit(AddTargetFailure(errMessage: e.toString()));
    }
  }
}

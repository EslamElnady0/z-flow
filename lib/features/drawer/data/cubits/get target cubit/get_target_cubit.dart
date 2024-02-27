import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/drawer/data/models/target%20model/target_model.dart';

part 'get_target_state.dart';

class GetTargetCubit extends Cubit<GetTargetState> {
  GetTargetCubit() : super(GetTargetInitial());

  List<TargetModel> targetsList = [];

  getTargets() {
    var targetBox = Hive.box<TargetModel>(Constants.targetBox);
    targetsList = targetBox.values.toList();
    emit(GetTargetSuccess());
  }
}

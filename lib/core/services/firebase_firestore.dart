import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/drawer/data/models/target model/target_model.dart';
import '../../features/home/data/models/habits model/habit_model.dart';

class FirebaseFirestoreServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  //add new user data
  addUserToFirestore(UserModel userModel) async {
    try {
      await firestore
          .collection("users")
          .doc(userModel.uid)
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//////////////////////////////////////////////////////////////////////////////////
  /// / / / / / / // / / / //  Addition Functions /////////////////////////////////////////////////////
  addHabitToFirestore(
      {required HabitModel habitModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("habits")
          .doc(habitModel.id.toString())
          .set(habitModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////
  addTaskToFirestore(
      {required TaskModel taskModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(taskModel.id.toString())
          .set(taskModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////
  addTargetToFirestore(
      {required TargetModel targetModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("targets")
          .doc(targetModel.createdAt)
          .set(targetModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////
  /// / / / / / / // / / / //  Deletion Functions /////////////////////////////////////////////////////

  deleteTaskFromFirestore(
      {required TaskModel taskModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(taskModel.id.toString())
          .delete();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////

  deleteHabitFromFirestore(
      {required HabitModel habitModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("habits")
          .doc(habitModel.id.toString())
          .delete();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  deleteTargetFromFirestore(
      {required TargetModel targetModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("targets")
          .doc(targetModel.createdAt)
          .delete();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  /// / / / / / / // / / / //  Edit Functions /////////////////////////////////////////////////////
  editTaskInFirestore(
      {required TaskModel taskModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(taskModel.id.toString())
          .update(taskModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  editHabitInFirestore(
      {required HabitModel habitModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("habits")
          .doc(habitModel.id.toString())
          .update(habitModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  editTargetInFirestore(
      {required TargetModel targetModel, required String uid}) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("targets")
          .doc(targetModel.createdAt)
          .update(targetModel.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////
  /// / / / / / / // / / / //  Get Functions /////////////////////////////////////////////////////

  getTasksFromFirestore({required String uid}) async {
    try {
      return await firestore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .get();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////
  getHabitsFromFirestore({required String uid}) async {
    try {
      return await firestore
          .collection("users")
          .doc(uid)
          .collection("habits")
          .get();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////
  getTargetsFromFirestore({required String uid}) async {
    try {
      return await firestore
          .collection("users")
          .doc(uid)
          .collection("targets")
          .get();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

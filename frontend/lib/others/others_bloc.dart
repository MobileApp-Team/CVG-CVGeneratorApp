
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../service/database_helper.dart';
import 'package:flutter/material.dart';

part 'others_event.dart';
part 'others_state.dart';

class OthersBloc extends Bloc<OthersEvent, Map<String, dynamic>> {
  final _othersController = BehaviorSubject<Map<String, dynamic>>();

  final _databaseHelper = DatabaseHelper();

  // othersBloc(super.initialState);
  OthersBloc() : super({});

  Stream<Map<String, dynamic>> get othersStream =>
      _othersController.stream;

  void dispose() {
    _othersController.close();
  }

  Future<void> loadOthers() async {
    final others = await _databaseHelper.queryAllOthers();
    if (others.isNotEmpty) {
      _othersController.add(others.first);
    }
  }

  Future<void> saveOthers(Map<String, dynamic> others) async {
    await _databaseHelper.insertOthers(others);
    _othersController.add(others);
  }

  Future<void> updateOthers(Map<String, dynamic> others) async {
    await _databaseHelper.updateOthers(others);
    _othersController.add(others);
  }

  Future<void> deleteOthers(int id) async {
    await _databaseHelper.deleteOthers(id);
    _othersController.add({});
  }

  void updateSkill(String skill) {
    final currentothers = _othersController.value;
    final newothers = {
      ...currentothers,
      'skill': skill,
    };
    _othersController.add(newothers);
  }

  void updateEducation(String education) {
    final currentothers = _othersController.value;
    final newothers = {
      ...currentothers,
      'education': education,
    };
    _othersController.add(newothers);
  }

  void updateAdditionalInfo(String additionalInfo) {
    final currentothers = _othersController.value;
    final newothers = {
      ...currentothers,
      'additionalInfo': additionalInfo,
    };
    _othersController.add(newothers);
  }
}

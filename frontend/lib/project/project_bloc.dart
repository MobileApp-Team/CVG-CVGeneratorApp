import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../service/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'project_event.dart';
part 'project_state.dart';


class ProjectBloc extends Bloc<ProjectEvent, Map<String, dynamic>> {
  final _projectController = BehaviorSubject<Map<String, dynamic>>();

  final _databaseHelper = DatabaseHelper();

  // projectBloc(super.initialState);
  ProjectBloc() : super({});

  Stream<Map<String, dynamic>> get projectStream =>
      _projectController.stream;

  void dispose() {
    _projectController.close();
  }

  Future<void> loadProject() async {
    final project = await _databaseHelper.queryAllProject();
    if (project.isNotEmpty) {
      _projectController.add(project.first);
    }
  }

  Future<void> saveProject(Map<String, dynamic> project) async {
    await _databaseHelper.insertProject(project);
    _projectController.add(project);
  }

  Future<void> updateProject(Map<String, dynamic> project) async {
    await _databaseHelper.updateProject(project);
    _projectController.add(project);
  }

  Future<void> deleteProject(int id) async {
    await _databaseHelper.deleteProject(id);
    _projectController.add({});
  }

  void updateProjectTitle(String projectTitle) {
    final currentproject = _projectController.value;
    final newproject = {
      ...currentproject,
      'title': projectTitle,
    };
    _projectController.add(newproject);
  }

  void updateDescription(String description) {
    final currentproject = _projectController.value;
    final newproject = {
      ...currentproject,
      'email': description,
    };
    _projectController.add(newproject);
  }
}


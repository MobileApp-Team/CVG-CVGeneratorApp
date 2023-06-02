import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../service/database_helper.dart';
import 'package:flutter/material.dart';

part 'experience_event.dart';
part 'experience_state.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, Map<String, dynamic>> {
  final _experienceController = BehaviorSubject<Map<String, dynamic>>();

  final _databaseHelper = DatabaseHelper();

  // ExperienceBloc(super.initialState);
  ExperienceBloc() : super({});

  Stream<Map<String, dynamic>> get experienceStream =>
      _experienceController.stream;

  void dispose() {
    _experienceController.close();
  }

  Future<void> loadExperience() async {
    final experience = await _databaseHelper.queryAllExperience();
    if (experience.isNotEmpty) {
      _experienceController.add(experience.first);
    }
  }

  Future<void> saveExperience(Map<String, dynamic> experience) async {
    await _databaseHelper.insertExperience(experience);
    _experienceController.add(experience);
  }

  Future<void> updateExperience(Map<String, dynamic> experience) async {
    await _databaseHelper.updateExperience(experience);
    _experienceController.add(experience);
  }

  Future<void> deleteExperience(int id) async {
    await _databaseHelper.deleteExperience(id);
    _experienceController.add({});
  }

  void updateJobTitle(String jobTitle) {
    final currentExperience = _experienceController.value;
    final newExperience = {
      ...currentExperience,
      'job_title': jobTitle,
    };
    _experienceController.add(newExperience);
  }

  void updateOrganizationName(String organizationName) {
    final currentExperience = _experienceController.value;
    final newExperience = {
      ...currentExperience,
      'organization_name': organizationName,
    };
    _experienceController.add(newExperience);
  }

  void updateDescription(String description) {
    final currentExperience = _experienceController.value;
    final newExperience = {
      ...currentExperience,
      'description': description,
    };
    _experienceController.add(newExperience);
  }
}

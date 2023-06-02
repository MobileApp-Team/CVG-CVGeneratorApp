import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../service/database_helper.dart';
import 'package:flutter/material.dart';

part 'personal_detail_event.dart';
part 'personal_detail_state.dart';

class PersonalDetailBloc extends Bloc<PersonalDetailEvent, Map<String, dynamic>> {
  final _personalDetailController = BehaviorSubject<Map<String, dynamic>>();

  final _databaseHelper = DatabaseHelper();

  // PersonalDetailBloc(super.initialState);
  PersonalDetailBloc() : super({});

  Stream<Map<String, dynamic>> get personalDetailStream =>
      _personalDetailController.stream;

  void dispose() {
    _personalDetailController.close();
  }

  Future<void> loadPersonalDetail() async {
    final personalDetail = await _databaseHelper.queryAllpersonalDetail();
    if (personalDetail.isNotEmpty) {
      _personalDetailController.add(personalDetail.first as Map<String, dynamic>);
    }
  }

  Future<void> savePersonalDetail(Map<String, dynamic> personalDetail) async {
    await _databaseHelper.insertPersonalDetail(personalDetail);
    _personalDetailController.add(personalDetail);
  }

  Future<void> updatePersonalDetail(Map<String, dynamic> personalDetail) async {
    await _databaseHelper.updatePersonalDetail(personalDetail);
    _personalDetailController.add(personalDetail);
  }

  Future<void> deletePersonalDetail(int id) async {
    await _databaseHelper.deletePersonalDetail(id);
    _personalDetailController.add({});
  }

  void updateFullName(String fullName) {
    final currentPersonalDetail = _personalDetailController.value;
    final newPersonalDetail = {
      ...currentPersonalDetail,
      'fullName': fullName,
    };
    _personalDetailController.add(newPersonalDetail);
  }

  void updateEmail(String email) {
    final currentPersonalDetail = _personalDetailController.value;
    final newPersonalDetail = {
      ...currentPersonalDetail,
      'email': email,
    };
    _personalDetailController.add(newPersonalDetail);
  }

  void updateProfession(String profession) {
    final currentPersonalDetail = _personalDetailController.value;
    final newPersonalDetail = {
      ...currentPersonalDetail,
      'profession': profession,
    };
    _personalDetailController.add(newPersonalDetail);
  }

  void updatePhoneNumber(String phoneNumber) {
    final currentPersonalDetail = _personalDetailController.value;
    final newPersonalDetail = {
      ...currentPersonalDetail,
      'phoneNumber': phoneNumber,
    };
    _personalDetailController.add(newPersonalDetail);
  }

  void updateCountry(String country) {
    final currentPersonalDetail = _personalDetailController.value;
    final newPersonalDetail = {
      ...currentPersonalDetail,
      'country': country,
    };
    _personalDetailController.add(newPersonalDetail);
  }

  void updateCity(String city) {
    final currentPersonalDetail = _personalDetailController.value;
    final newPersonalDetail = {
      ...currentPersonalDetail,
      'city': city,
    };
    _personalDetailController.add(newPersonalDetail);
  }
}

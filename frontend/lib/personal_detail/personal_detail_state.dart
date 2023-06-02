part of 'personal_detail_bloc.dart';

@immutable
abstract class PersonalDetailStateBloc {}

class PersonalDetailInitial extends PersonalDetailStateBloc {}
class PersonalDetailSavedState extends PersonalDetailStateBloc {}
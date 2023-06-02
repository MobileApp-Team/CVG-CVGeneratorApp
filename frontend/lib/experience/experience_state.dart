part of 'experience_bloc.dart';

@immutable
abstract class ExperienceStateBloc {}

class ExperienceInitial extends ExperienceStateBloc {}
class ExperienceSavedState extends ExperienceStateBloc {}
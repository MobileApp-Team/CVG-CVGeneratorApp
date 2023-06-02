part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}
class NextPageEvent extends PageEvent {}
class PreviousPageEvent extends PageEvent {}


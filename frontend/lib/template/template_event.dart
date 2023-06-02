part of 'template_bloc.dart';

@immutable
abstract class TemplateEvent {}

class SelectTemplateEvent extends TemplateEvent {
  final int templateIndex;

  SelectTemplateEvent(this.templateIndex);
}


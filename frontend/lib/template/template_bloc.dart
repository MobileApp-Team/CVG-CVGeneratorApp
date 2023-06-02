import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'template_event.dart';
part 'template_state.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  TemplateBloc() : super(TemplateState('template1.html'));

  @override
  Stream<TemplateState> mapEventToState(TemplateEvent event) async* {
    if (event is SelectTemplateEvent) {
      if (event.templateIndex == 1) {
        yield TemplateState('template1.html');
      } else if (event.templateIndex == 2) {
        yield TemplateState('template2.html');
      }
    }
  }
}


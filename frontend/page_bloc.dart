import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';


class PageBloc extends Bloc<PageEvent, int> {
  PageBloc() : super(1);

  @override
  Stream<int> mapEventToState(PageEvent event) async* {
    if (event is NextPageEvent) {
      yield state + 1;
    } else if (event is PreviousPageEvent) {
      yield state - 1;
    }
  }
}
 

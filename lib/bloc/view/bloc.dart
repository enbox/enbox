import "dart:async";

import "package:bloc/bloc.dart";

import "package:enbox/bloc/view.dart";

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  @override
  ViewState get initialState => const NoView();

  @override
  Stream<ViewState> mapEventToState(
    ViewEvent event,
  ) async* {
    if (event is SelectView) {
      yield* mapSelectToState(event);
    }
  }

  Stream<ViewState> mapSelectToState(
    SelectView select,
  ) async* {
    yield ViewSelected(selectedView: select.viewName);
  }
}

import "package:meta/meta.dart";
import "package:equatable/equatable.dart";

abstract class ViewEvent extends Equatable {
  const ViewEvent();
}

class SelectView extends ViewEvent {
  final String viewName;

  const SelectView({@required this.viewName});

  @override
  List<Object> get props => [viewName];
}

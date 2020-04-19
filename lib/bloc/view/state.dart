import "package:meta/meta.dart";
import "package:equatable/equatable.dart";

abstract class ViewState extends Equatable {
  const ViewState();
}

class NoView extends ViewState {
  const NoView();

  @override
  List<Object> get props => [];
}

class ViewSelected extends ViewState {
  final String selectedView;

  const ViewSelected({@required this.selectedView})
      : assert(selectedView != null);

  @override
  List<Object> get props => [selectedView];
}
